class CenterInformationModel {
  String name = "";
  String location = "";
  List<OpeningHours> openingHours = [];
  List<OpeningHours> mannedHours = [];
  String email = "";
  String phoneNumber = "";
  List<OpeningHours> heatMapDataPoints = [];
  String latitude = "";
  String longitude = "";

  CenterInformationModel(
      {required this.name,
      required this.location,
      required this.openingHours,
      required this.mannedHours,
      required this.email,
      required this.phoneNumber,
      required this.heatMapDataPoints,
      required this.latitude,
      required this.longitude});

  CenterInformationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    if (json['openingHours'] != null) {
      openingHours = <OpeningHours>[];
      json['openingHours'].forEach((v) {
        openingHours.add(new OpeningHours.fromJson(v));
      });
    }
    if (json['mannedHours'] != null) {
      mannedHours = <OpeningHours>[];
      json['mannedHours'].forEach((v) {
        mannedHours.add(new OpeningHours.fromJson(v));
      });
    }
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    if (json['heatMapDataPoints'] != null) {
      heatMapDataPoints = <OpeningHours>[];
      json['heatMapDataPoints'].forEach((v) {
        heatMapDataPoints.add(new OpeningHours.fromJson(v));
      });
    }
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['openingHours'] = this.openingHours.map((v) => v.toJson()).toList();
    data['mannedHours'] = this.mannedHours.map((v) => v.toJson()).toList();
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['heatMapDataPoints'] =
        this.heatMapDataPoints.map((v) => v.toJson()).toList();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class OpeningHours {
  String item1 = "";
  String item2 = "";

  OpeningHours({required this.item1, required this.item2});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    item1 = json['item1'];
    item2 = json['item2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item1'] = this.item1;
    data['item2'] = this.item2;
    return data;
  }
}
