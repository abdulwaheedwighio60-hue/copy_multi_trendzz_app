
import 'package:multi_trendzz/core/model/country_model.dart';

class AppConstants {
  AppConstants._();

  static const List<CountryModel> phoneCountries = [
    CountryModel(
      flag: '🇵🇰',
      name: 'Pakistan',
      code: '+92',
    ),
    CountryModel(
      flag: '🇮🇳',
      name: 'India',
      code: '+91',
    ),
    CountryModel(
      flag: '🇦🇪',
      name: 'UAE',
      code: '+971',
    ),
    CountryModel(
      flag: '🇸🇦',
      name: 'Saudi Arabia',
      code: '+966',
    ),
    CountryModel(
      flag: '🇺🇸',
      name: 'United States',
      code: '+1',
    ),
    CountryModel(
      flag: '🇬🇧',
      name: 'United Kingdom',
      code: '+44',
    ),
  ];
}