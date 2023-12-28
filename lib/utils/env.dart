import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Future init() async {
    await dotenv.load(fileName: '.env'); //First we load the file of .env
  }

  static int getInt(String $key, {int defaultValue = 0}) =>
      int.parse(dotenv.get($key, fallback: defaultValue.toString()));

  static double getDouble(String $key, {double defaultValue = 0}) =>
      double.parse(dotenv.get($key, fallback: defaultValue.toString()));

  static String getString(String $key, {String defaultValue = ''}) =>
      dotenv.get($key, fallback: defaultValue); //if no value found return null

  static bool getBool(String $key, {bool defaultValue = false}) =>
      bool.hasEnvironment(dotenv.get($key, fallback: defaultValue.toString()));
}
