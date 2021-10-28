class Appointments {
  String headline = "";
  String image = "";
  String date = "";

  Appointments({required this.headline, required this.image, required this.date});

  Appointments.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headline'] = this.headline;
    data['image'] = this.image;
    data['date'] = this.date;
    return data;
  }
}