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
  Future<AuthResponse?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
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



  Future<void> sendOtpEmail({
    required String email,
    required String otp,
  }) async {
    const String username = 'spermscope.app@gmail.com';
    const String password = 'gcbndveousxlnhih';

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
      </head>
      
      <body style="margin:0;padding:0;background:#f4f6f9;font-family:Arial,Helvetica,sans-serif;">
      
      <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f6f9;padding:40px 0;">
      <tr>
      <td align="center">
      
      <table width="600" cellpadding="0" cellspacing="0"
      style="background:#ffffff;border-radius:16px;overflow:hidden;
      box-shadow:0 8px 25px rgba(0,0,0,.08);">
      
      <!-- Header -->
      <tr>
      <td align="center"
      style="background:#FF4747;padding:28px;">
      
      <h1 style="
      margin:0;
      color:#ffffff;
      font-size:28px;
      font-weight:bold;">
      🛍️ Multi Trendzz
      </h1>
      
      <p style="
      margin-top:8px;
      color:#ffecec;
      font-size:15px;">
      Your Trusted Online Shopping Store
      </p>
      
      </td>
      </tr>
      
      <!-- Body -->
      <tr>
      <td style="padding:35px;">
      
      <h2 style="
      margin-top:0;
      color:#222;">
      Verify Your Email Address
      </h2>
      
      <p style="
      color:#555;
      font-size:15px;
      line-height:26px;">
      Hello,
      </p>
      
      <p style="
      color:#555;
      font-size:15px;
      line-height:26px;">
      Thank you for creating your <b>Multi Trendzz</b> account.
      To complete your registration, please verify your email address using the One-Time Password (OTP) below.
      </p>
      
      <!-- OTP Box -->
      <div style="
      margin:35px 0;
      text-align:center;">
      
      <div style="
      display:inline-block;
      background:#FFF5F5;
      border:2px dashed #FF4747;
      border-radius:14px;
      padding:18px 35px;
      font-size:40px;
      font-weight:bold;
      letter-spacing:10px;
      color:#FF4747;">
      
      $otp
      
      </div>
      
      </div>
      
      <p style="
      text-align:center;
      font-size:15px;
      color:#666;">
      This verification code will expire in
      <b>5 minutes.</b>
      </p>
      
      <hr style="
      border:none;
      border-top:1px solid #eeeeee;
      margin:30px 0;">
      
      <p style="
      font-size:14px;
      color:#777;
      line-height:24px;">
      
      If you did not request this email, you can safely ignore it.
      No changes will be made to your account.
      
      </p>
      
      </td>
      </tr>
      
      <!-- Footer -->
      <tr>
      <td align="center"
      style="
      background:#fafafa;
      padding:25px;
      border-top:1px solid #eeeeee;">
      
      <p style="
      margin:0;
      font-size:14px;
      color:#666;">
      Thank you for choosing
      <b style="color:#FF4747;">Multi Trendzz</b>
      </p>
      
      <p style="
      margin-top:10px;
      font-size:12px;
      color:#999;">
      © 2026 Multi Trendzz. All Rights Reserved.
      </p>
      
      </td>
      </tr>
      
      </table>
      
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

  Future<String?> sendOtp({
    required String email,
  }) async {
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


  Future<String?> verifyOtp({
    required String email,
    required String enteredOtp,
  }) async {
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


  Future<String?> resendOtp({
    required String email,
  }) async {
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