import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class BahasaIndonesia implements FlutterPwValidatorStrings {
  @override
  // TODO: implement atLeast
  // String get atLeast => throw UnimplementedError();
  final String atLeast = 'Setidaknya - Karakter';

  @override
  // TODO: implement numericCharacters
  // String get numericCharacters => throw UnimplementedError();
  final String numericCharacters = '- Angka';

  @override
  // TODO: implement specialCharacters
  // String get specialCharacters => throw UnimplementedError();
  final String specialCharacters = '- Karakter Special';

  @override
  // TODO: implement uppercaseLetters
  // String get uppercaseLetters => throw UnimplementedError();
  final String uppercaseLetters = '- Huruf Kapital';
}
