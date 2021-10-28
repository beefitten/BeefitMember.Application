class FitnessPackage {
  static final FitnessPackage _instance = FitnessPackage._internal();

  // All attributes are initialized with default values
  static String name = "Default Fitness Center";
  static String primaryColor = "0x063EF9";
  static String secondaryColor = "0xF7F7FC";
  static String logo = "noPath";

  static List<int> features = [0, 1, 2]; // Could also be a list of ints

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
    logo = json['logo'].toString();

    List<dynamic> featureDynamicList = json['features'];
    features = featureDynamicList.cast<int>();
  }
}
