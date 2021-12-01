class WeightGoalModel {
  String user = "";
  int currentWeight = 0;
  int targetWeight = 0;

  WeightGoalModel(
      {required this.user,
      required this.currentWeight,
      required this.targetWeight});

  WeightGoalModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    currentWeight = json['currentWeight'];
    targetWeight = json['targetWeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['currentWeight'] = this.currentWeight;
    data['targetWeight'] = this.targetWeight;
    return data;
  }
}
