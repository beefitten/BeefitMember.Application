class Classes {
  String classId = "";
  String fitnessName = "";
  String className = "";
  String classType = "";
  String classImage = "";
  bool isFull = false;
  int maxParticipants = 0;
  int numberOfParticipants = 0;
  DateTime timeStart = DateTime.now();
  DateTime timeEnd = DateTime.now();
  List<String> participants = [];
  String location = "";

  Classes(
      {required this.classId,
        required this.fitnessName,
        required this.className,
        required this.classType,
        required this.classImage,
        required this.isFull,
        required this.maxParticipants,
        required this.numberOfParticipants,
        required this.timeStart,
        required this.timeEnd,
        required this.participants,
        required this.location});

  Classes.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    fitnessName = json['fitnessName'];
    className = json['className'];
    classType = json['classType'];
    classImage = json['classImage'];
    isFull = json['isFull'];
    maxParticipants = json['maxParticipants'];
    numberOfParticipants = json['numberOfParticipants'];
    timeStart = DateTime.parse(json['timeStart']);
    timeEnd = DateTime.parse(json['timeEnd']);
    participants = json['participants'].cast<String>();
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classId'] = this.classId;
    data['fitnessName'] = this.fitnessName;
    data['className'] = this.className;
    data['classType'] = this.classType;
    data['classImage'] = this.classImage;
    data['isFull'] = this.isFull;
    data['maxParticipants'] = this.maxParticipants;
    data['numberOfParticipants'] = this.numberOfParticipants;
    data['timeStart'] = this.timeStart;
    data['timeEnd'] = this.timeEnd;
    data['participants'] = this.participants;
    data['location'] = this.location;
    return data;
  }
}