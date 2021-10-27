import 'package:flutter/material.dart';

class FitnessPackage {
  static final FitnessPackage _instance = FitnessPackage._internal();

  // All attributes are initialized with default values
  static String name = "Default Fitness Center";
  static String primaryColor = "0x063EF9";
  static String secondaryColor = "0xF7F7FC";
  static String thirdColor = "";
  static Color backgroundColor = Colors.white;
  static String generalFond = "";
  
  static String H1 = "18";
  static String H1Weight = "";
  static String H1FontFamily = "";

  static String H2 = "16";
  static String H2Weight = "";
  static String H2FontFamily = "";

  static String H3 = "14";
  static String H3Weight = "";
  static String H3FontFamily = "";

  static String borderRadius = "";
  static double elevation = 3;
  static String logo = "noPath";

  static List<int> features = []; // Could also be a list of ints

  factory FitnessPackage() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  FitnessPackage._internal() {
    // initialization logic
  }

  // Get the latest fitness package configuration
  void update(dynamic json) {
    // Save values in class attributes
    name = json['name'].toString();
    primaryColor = json['primaryColor']
        .toString(); // Might need to be changed to a "Color"
    secondaryColor = json['secondaryColor'].toString();
    thirdColor = json['ThirdColor'].toString();
    backgroundColor = Color(int.parse(json['BackgroundColor'].toString()));
    logo = json['logo'].toString();

    List<dynamic> featureDynamicList = json['features'];
    features = featureDynamicList.cast<int>();
  }
}
