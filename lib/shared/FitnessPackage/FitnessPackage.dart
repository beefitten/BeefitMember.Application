class FitnessPackage {
  static final FitnessPackage _instance = FitnessPackage._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory FitnessPackage() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  FitnessPackage._internal() {
    // initialization logic
  }

  // Get the latest fitness package configuration
  void update() {
    // Send POST to MS-FitnessPackage
    // Save values in attributes
  }
}
