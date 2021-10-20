class Classes {
  List<Results> results = <Results>[];

  Classes({required this.results});

  Classes.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String picture = "";
  String headline = "";
  String date = "";
  String address = "";

  Results({
    required this.picture,
    required this.headline,
    required this.date,
    required this.address});

  Results.fromJson(Map<String, dynamic> json) {
    picture = json['Picture'];
    headline = json['Headline'];
    date = json['Date'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Picture'] = this.picture;
    data['Headline'] = this.headline;
    data['Date'] = this.date;
    data['Address'] = this.address;
    return data;
  }
}