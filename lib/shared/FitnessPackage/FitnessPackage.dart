import 'FitnessPackageModel.dart';

class FitnessPackage {
  static final FitnessPackage _instance = FitnessPackage._internal();

  static late FitnessPackageModel model;

  factory FitnessPackage() {
    return _instance;
  }

  FitnessPackage._internal();

  void update(dynamic json) {
    model = FitnessPackageModel.fromJson(json);
  }
}
