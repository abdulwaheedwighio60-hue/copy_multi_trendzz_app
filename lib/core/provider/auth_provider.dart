import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:multi_trendzz/core/services/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// ==========================
  /// SIGN UP
  /// ==========================
  Future<AuthResponse?> signUp({required String name, required String email, required String password,}) async {
    try {
      _setLoading(true);

      final response = await SupabaseService.client.auth
          .signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      )
          .timeout(const Duration(seconds: 30));

      return response;
    } on SocketException {
      throw "No internet connection.";
    } on TimeoutException {
      throw "Request timed out.";
    } on AuthException catch (e) {
      switch (e.code) {
        case 'email_exists':
        case 'user_already_exists':
          throw "An account already exists with this email.";

        case 'invalid_credentials':
          throw "Invalid email or password.";

        case 'email_address_invalid':
          throw "Please enter a valid email address.";

        case 'weak_password':
          throw "Password should be at least 6 characters.";

        default:
          throw e.message;
      }
    } catch (e) {
      print("Signup Error : $e");
      throw e.toString();
    } finally {
      _setLoading(false);
    }
  }


  /// ==========================
  /// LOGIN
  /// ==========================
  Future<AuthResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);

      final response = await SupabaseService.client.auth
          .signInWithPassword(
        email: email,
        password: password,
      )
          .timeout(const Duration(seconds: 30));

      print("========== LOGIN SUCCESS ==========");
      print("User ID : ${response.user?.id}");
      print("Email   : ${response.user?.email}");

      return response;
    }

    on SocketException {
      throw "No internet connection.";
    }

    on TimeoutException {
      throw "Request timed out.";
    }

    on AuthException catch (e) {
      print("========== LOGIN ERROR ==========");
      print(e.message);

      switch (e.code) {
        case 'invalid_credentials':
          throw "Invalid email or password.";

        case 'email_not_confirmed':
          throw "Please verify your email before logging in.";

        default:
          throw e.message;
      }
    }

    catch (e) {
      print("Login Error : $e");
      throw e.toString();
    }

    finally {
      _setLoading(false);
    }
  }

  /// ==========================
  /// COMPLETE PROFILE
  /// ==========================
  Future<void> completeProfile({
    required String fullName,
    required String phone,
    required String dob,
    required String gender,
    required String country,
    required String state,
    required String city,
    required String address,
    required String postalCode,
    String? profileImage,
  }) async {
    try {
      _setLoading(true);

      final user = SupabaseService.client.auth.currentUser;

      print("========== CURRENT USER ==========");
      print("User ID : ${user?.id}");
      print("Email   : ${user?.email}");

      if (user == null) {
        throw Exception("User not found.");
      }

      final Map<String, dynamic> data = {
        "id": user.id,
        "email": user.email,
        "full_name": fullName,
        "phone": phone,
        "date_of_birth": dob,
        "gender": gender,
        "country": country,
        "state": state,
        "city": city,
        "address": address,
        "postal_code": postalCode,
        "profile_image": profileImage,
      };

      print("========== INSERT DATA ==========");
      print(data);

      final response = await SupabaseService.client
          .from("profiles")
          .upsert(data)
          .select();

      print("========== RESPONSE ==========");
      print(response);

      print("Profile Saved Successfully");
    } on PostgrestException catch (e) {
      print("========== POSTGREST ERROR ==========");
      print("Message : ${e.message}");
      print("Code    : ${e.code}");
      print("Details : ${e.details}");
      print("Hint    : ${e.hint}");

      throw e.message;
    } on AuthException catch (e) {
      print("========== AUTH ERROR ==========");
      print(e.message);

      throw e.message;
    } on SocketException {
      throw "No internet connection.";
    } on TimeoutException {
      throw "Request timed out.";
    } catch (e, stackTrace) {
      print("========== UNKNOWN ERROR ==========");
      print(e);
      print(stackTrace);

      throw e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<String?> uploadProfileImage(File image) async {
    try {
      final user = SupabaseService.client.auth.currentUser;

      if (user == null) {
        throw Exception("User not found");
      }

      final fileName =
          "${user.id}_${DateTime.now().millisecondsSinceEpoch}.jpg";

      await SupabaseService.client.storage
          .from('profile-images')
          .upload(fileName, image);

      final imageUrl = SupabaseService.client.storage
          .from('profile-images')
          .getPublicUrl(fileName);

      return imageUrl;
    } on StorageException catch (e) {
      print("Storage Error: ${e.message}");
      rethrow;
    } catch (e) {
      print("Upload Error: $e");
      rethrow;
    }
  }



  Future<void> sendOtpEmail({required String email, required String otp,}) async {
    const String username = 'multitrendzz.dev@gmail.com';
    const String password = 'wknrjefkgasrjblo';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Multi Trendzz')
      ..recipients.add(email)
      ..subject = '🔐 Verify Your Email Address | Multi Trendzz'
      ..html = '''
      <!DOCTYPE html>
      <html>
      <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Verify Your Email - Multi Trendzz</title>
      </head>
      
      <body style="
      margin:0;
      padding:0;
      background-color:#f5f6f8;
      font-family:Arial,Helvetica,sans-serif;
      ">
      
      <table
      width="100%"
      border="0"
      cellpadding="0"
      cellspacing="0"
      style="background-color:#f5f6f8;padding:40px 15px;"
      >
      <tr>
      <td align="center">
      
      <!-- Main Card -->
      <table
      width="600"
      border="0"
      cellpadding="0"
      cellspacing="0"
      style="
      max-width:600px;
      width:100%;
      background:#ffffff;
      border-radius:18px;
      overflow:hidden;
      box-shadow:0 6px 24px rgba(0,0,0,0.08);
      "
      >
      
      <!-- ================= HEADER ================= -->
      
      <tr>
      <td
      align="center"
      style="
      background:#FF4747;
      padding:32px 25px;
      "
      >
      
      <div style="
      font-size:34px;
      margin-bottom:8px;
      ">
      🛍️
      </div>
      
      <h1 style="
      margin:0;
      color:#ffffff;
      font-size:28px;
      font-weight:700;
      letter-spacing:0.3px;
      ">
      Multi Trendzz
      </h1>
      
      <p style="
      margin:8px 0 0 0;
      color:#ffecec;
      font-size:14px;
      line-height:22px;
      ">
      Shop Smart. Shop Trendy.
      </p>
      
      </td>
      </tr>
      
      
      <!-- ================= BODY ================= -->
      
      <tr>
      <td
      style="
      padding:40px 38px;
      "
      >
      
      <h2 style="
      margin:0 0 14px 0;
      color:#202124;
      font-size:23px;
      font-weight:700;
      ">
      Verify Your Email Address
      </h2>
      
      <p style="
      margin:0 0 18px 0;
      color:#555555;
      font-size:15px;
      line-height:25px;
      ">
      Hello,
      </p>
      
      <p style="
      margin:0;
      color:#555555;
      font-size:15px;
      line-height:26px;
      ">
      Thank you for creating your
      <strong style="color:#FF4747;">
      Multi Trendzz
      </strong>
      account.
      </p>
      
      <p style="
      margin:10px 0 0 0;
      color:#555555;
      font-size:15px;
      line-height:26px;
      ">
      Please use the verification code below to confirm your email address and complete your registration.
      </p>
      
      
      <!-- ================= OTP SECTION ================= -->
      
      <table
      width="100%"
      border="0"
      cellpadding="0"
      cellspacing="0"
      style="margin:32px 0;"
      >
      <tr>
      <td
      align="center"
      style="
      background:#fff7f7;
      border:1px solid #ffd6d6;
      border-radius:14px;
      padding:25px 15px;
      "
      >
      
      <p style="
      margin:0 0 10px 0;
      font-size:12px;
      font-weight:600;
      color:#888888;
      text-transform:uppercase;
      letter-spacing:1px;
      ">
      Your Verification Code
      </p>
      
      <div style="
      font-size:38px;
      font-weight:700;
      letter-spacing:9px;
      color:#FF4747;
      line-height:48px;
      ">
      $otp
      </div>
      
      </td>
      </tr>
      </table>
      
      
      <!-- ================= EXPIRY ================= -->
      
      <table
      width="100%"
      border="0"
      cellpadding="0"
      cellspacing="0"
      style="margin-bottom:28px;"
      >
      <tr>
      <td
      align="center"
      style="
      background:#f8f9fa;
      border-radius:10px;
      padding:13px;
      "
      >
      
      <p style="
      margin:0;
      font-size:14px;
      color:#666666;
      line-height:22px;
      ">
      ⏱️ This verification code expires in
      <strong style="color:#222222;">
      5 minutes
      </strong>.
      </p>
      
      </td>
      </tr>
      </table>
      
      
      <!-- ================= SECURITY ================= -->
      
      <table
      width="100%"
      border="0"
      cellpadding="0"
      cellspacing="0"
      style="
      background:#fafafa;
      border-radius:12px;
      "
      >
      <tr>
      <td style="padding:18px;">
      
      <p style="
      margin:0 0 7px 0;
      font-size:14px;
      font-weight:700;
      color:#333333;
      ">
      🔒 Security Notice
      </p>
      
      <p style="
      margin:0;
      font-size:13px;
      line-height:22px;
      color:#777777;
      ">
      Never share this verification code with anyone.
      Multi Trendzz will never ask you to share your OTP or password.
      </p>
      
      </td>
      </tr>
      </table>
      
      
      <hr style="
      border:none;
      border-top:1px solid #eeeeee;
      margin:30px 0;
      ">
      
      
      <p style="
      margin:0;
      font-size:13px;
      line-height:22px;
      color:#888888;
      ">
      If you did not create a Multi Trendzz account or request this verification code, you can safely ignore this email.
      </p>
      
      </td>
      </tr>
      
      
      <!-- ================= FOOTER ================= -->
      
      <tr>
      <td
      align="center"
      style="
      background:#fafafa;
      padding:25px 20px;
      border-top:1px solid #eeeeee;
      "
      >
      
      <p style="
      margin:0;
      font-size:14px;
      color:#666666;
      ">
      Thank you for choosing
      <strong style="color:#FF4747;">
      Multi Trendzz
      </strong>
      </p>
      
      <p style="
      margin:8px 0 0 0;
      font-size:12px;
      color:#999999;
      ">
      Your trusted online shopping destination
      </p>
      
      <p style="
      margin:15px 0 0 0;
      font-size:11px;
      color:#aaaaaa;
      ">
      © 2026 Multi Trendzz. All Rights Reserved.
      </p>
      
      </td>
      </tr>
      
      </table>
      
      <!-- Bottom spacing -->
      
      <p style="
      margin:18px 0 0 0;
      font-size:11px;
      color:#aaaaaa;
      text-align:center;
      ">
      This is an automated email. Please do not reply.
      </p>
      
      </td>
      </tr>
      </table>
      
      </body>
      </html>
      ''';

    try {
      await send(message, smtpServer);
      debugPrint("OTP Email Sent Successfully");
    } on MailerException catch (e) {
      debugPrint("Mailer Error: ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("Email Error: $e");
      rethrow;
    }
  }
  Future<String?> sendOtp({required String email,}) async {
    try {
      _setLoading(true);

      final String userEmail = email.trim().toLowerCase();
      final String otp =
      (100000 + Random().nextInt(900000)).toString();

      // Delete old OTP
      await SupabaseService.client
          .from("email_otps")
          .delete()
          .eq("email", userEmail);

      // Save new OTP
      await SupabaseService.client
          .from("email_otps")
          .insert({
        "email": userEmail,
        "otp": otp,
        "expires_at": DateTime.now()
            .add(const Duration(minutes: 5))
            .toIso8601String(),
      });

      print("========== OTP SAVED ==========");
      print("Email : $userEmail");
      print("OTP   : $otp");

      // Send Email
      await sendOtpEmail(
        email: userEmail,
        otp: otp,
      );

      return null;
    } catch (e) {
      return e.toString();
    } finally {
      _setLoading(false);
    }
  }
  Future<String?> verifyOtp({required String email, required String enteredOtp,}) async {
    try {
      _setLoading(true);

      final String userEmail = email.trim().toLowerCase();

      print("========== VERIFY OTP ==========");
      print("Email      : $userEmail");
      print("Entered OTP: ${enteredOtp.trim()}");

      final Map<String, dynamic>? data =
      await SupabaseService.client
          .from("email_otps")
          .select()
          .eq("email", userEmail)
          .maybeSingle();
      print("Email = $email");
      print("Data = $data");
      if (data == null) {
        print("OTP Record Not Found");
        return "OTP not found";
      }

      print("Database OTP : ${data["otp"]}");

      final String savedOtp = data["otp"].toString();

      final DateTime expiresAt =
      DateTime.parse(data["expires_at"]);

      if (DateTime.now().isAfter(expiresAt)) {
        await SupabaseService.client
            .from("email_otps")
            .delete()
            .eq("email", userEmail);

        return "OTP has expired. Please request a new OTP.";
      }

      if (savedOtp.trim() != enteredOtp.trim()) {
        return "Invalid OTP";
      }

      // Delete OTP after successful verification
      await SupabaseService.client
          .from("email_otps")
          .delete()
          .eq("email", userEmail);

      print("OTP Verified Successfully");

      return null;
    } catch (e) {
      print("Verify OTP Error: $e");
      return e.toString();
    } finally {
      _setLoading(false);
    }
  }
  Future<String?> resendOtp({required String email,}) async {
    try {
      _setLoading(true);

      final otp = (100000 + Random().nextInt(900000)).toString();

      // Delete previous OTP
      await SupabaseService.client
          .from("email_otps")
          .delete()
          .eq("email", email);

      // Save new OTP
      await SupabaseService.client
          .from("email_otps")
          .insert({
        "email": email,
        "otp": otp,
        "expires_at":
        DateTime.now().add(const Duration(minutes: 5)).toIso8601String(),
      });

      await sendOtpEmail(
        email: email,
        otp: otp,
      );

      _setLoading(false);

      return null;
    } catch (e) {
      _setLoading(false);
      return e.toString();
    }
  }
}