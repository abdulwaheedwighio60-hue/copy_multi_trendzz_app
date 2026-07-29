import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SavedCardLocalService {
  SavedCardLocalService._();

  static final SavedCardLocalService instance =
  SavedCardLocalService._();

  static const String savedCardsKey = 'saved_cards';

  Future<SavedCardModel> saveCard({
    required String cardHolderName,
    required String cardNumber,
    required String expiryDate,
  }) async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();

    final List<String> savedCards =
        prefs.getStringList(savedCardsKey) ?? <String>[];

    final String digitsOnly =
    cardNumber.replaceAll(RegExp(r'\D'), '');

    final String last4 = _getLast4(digitsOnly);

    final SavedCardModel savedCard = SavedCardModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      cardHolderName: cardHolderName.trim(),
      maskedCardNumber: _getMaskedCardNumber(last4),
      last4: last4,
      expiryDate: expiryDate.trim(),
      brand: _getCardBrand(digitsOnly),
      createdAt: DateTime.now().toIso8601String(),
    );

    savedCards.add(jsonEncode(savedCard.toJson()));

    await prefs.setStringList(savedCardsKey, savedCards);

    debugPrint('CARD SAVED LOCALLY: ${savedCard.toJson()}');

    return savedCard;
  }

  Future<List<SavedCardModel>> getSavedCards() async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();

    final List<String> savedCards =
        prefs.getStringList(savedCardsKey) ?? <String>[];

    return savedCards.map((String item) {
      final Map<String, dynamic> json =
      Map<String, dynamic>.from(jsonDecode(item) as Map);

      return SavedCardModel.fromJson(json);
    }).toList();
  }

  Future<void> deleteCard(String cardId) async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();

    final List<String> savedCards =
        prefs.getStringList(savedCardsKey) ?? <String>[];

    final List<String> updatedCards =
    savedCards.where((String item) {
      final Map<String, dynamic> json =
      Map<String, dynamic>.from(jsonDecode(item) as Map);

      return json['id']?.toString() != cardId;
    }).toList();

    await prefs.setStringList(savedCardsKey, updatedCards);
  }

  Future<void> clearSavedCards() async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();

    await prefs.remove(savedCardsKey);
  }

  String getMaskedCardNumberFromInput(String cardNumber) {
    final String digitsOnly =
    cardNumber.replaceAll(RegExp(r'\D'), '');

    final String last4 = _getLast4(digitsOnly);

    return _getMaskedCardNumber(last4);
  }

  String getCardBrandFromInput(String cardNumber) {
    final String digitsOnly =
    cardNumber.replaceAll(RegExp(r'\D'), '');

    return _getCardBrand(digitsOnly);
  }

  String _getLast4(String digitsOnly) {
    if (digitsOnly.length < 4) {
      return digitsOnly;
    }

    return digitsOnly.substring(digitsOnly.length - 4);
  }

  String _getMaskedCardNumber(String last4) {
    if (last4.isEmpty) {
      return '**** **** **** ****';
    }

    return '**** **** **** $last4';
  }

  String _getCardBrand(String digitsOnly) {
    if (digitsOnly.startsWith('4')) {
      return 'Visa';
    }

    if (digitsOnly.startsWith('5')) {
      return 'MasterCard';
    }

    if (digitsOnly.startsWith('3')) {
      return 'American Express';
    }

    return 'Card';
  }
}

class SavedCardModel {
  SavedCardModel({
    required this.id,
    required this.cardHolderName,
    required this.maskedCardNumber,
    required this.last4,
    required this.expiryDate,
    required this.brand,
    required this.createdAt,
  });

  final String id;
  final String cardHolderName;
  final String maskedCardNumber;
  final String last4;
  final String expiryDate;
  final String brand;
  final String createdAt;

  factory SavedCardModel.fromJson(Map<String, dynamic> json) {
    return SavedCardModel(
      id: json['id']?.toString() ?? '',
      cardHolderName: json['cardHolderName']?.toString() ?? '',
      maskedCardNumber:
      json['maskedCardNumber']?.toString() ?? '',
      last4: json['last4']?.toString() ?? '',
      expiryDate: json['expiryDate']?.toString() ?? '',
      brand: json['brand']?.toString() ?? 'Card',
      createdAt: json['createdAt']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'cardHolderName': cardHolderName,
      'maskedCardNumber': maskedCardNumber,
      'last4': last4,
      'expiryDate': expiryDate,
      'brand': brand,
      'createdAt': createdAt,
    };
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String digitsOnly =
    newValue.text.replaceAll(RegExp(r'\D'), '');

    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);

      final int index = i + 1;

      if (index % 4 == 0 && index != digitsOnly.length) {
        buffer.write(' ');
      }
    }

    final String formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: formatted.length,
      ),
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String digitsOnly =
    newValue.text.replaceAll(RegExp(r'\D'), '');

    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2) {
        buffer.write('/');
      }

      buffer.write(digitsOnly[i]);
    }

    final String formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: formatted.length,
      ),
    );
  }
}