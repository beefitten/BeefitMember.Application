class FitnessPackage {
  static final FitnessPackage _instance = FitnessPackage._internal();

  // All attributes are initialized with default values
  String name = "Default Fitness Center";
  String primaryColor = "0x063EF9";
  String secondaryColor = "0xF7F7FC";
  String logo = "noPath";

  List<String> features = []; // Could also be a list of ints

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
    name = json['Name'].toString();
    primaryColor = json['PrimaryColor']
        .toString(); // Might need to be changed to a "Color"
    secondaryColor = json['SeconderyColor'].toString();
    logo = json['Logo'].toString();
    features = json['Features'];
  }
}
