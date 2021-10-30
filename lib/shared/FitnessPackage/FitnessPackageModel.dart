class FitnessPackageModel {
  String token = "";
  String name = "";
  String primaryColor = "";
  String secondaryColor = "";
  String thirdColor = "";
  String backgroundColor = "";
  String borderRadius = "";
  String elevation = "";
  String logo = "";
  List<int> features = [];
  late OverView overView;
  late WeightGoal weightGoal;
  late CenterInformation centerInformation;
  late More more;
  late Font font;
  late Bookings bookings;
  late UserInfo userInfo;

  FitnessPackageModel(
      {required this.token,
      required this.name,
      required this.primaryColor,
      required this.secondaryColor,
      required this.thirdColor,
      required this.backgroundColor,
      required this.borderRadius,
      required this.elevation,
      required this.logo,
      required this.features,
      required this.overView,
      required this.weightGoal,
      required this.centerInformation,
      required this.more,
      required this.font,
      required this.bookings,
      required this.userInfo});

  FitnessPackageModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    primaryColor = json['primaryColor'];
    secondaryColor = json['secondaryColor'];
    thirdColor = json['thirdColor'];
    backgroundColor = json['backgroundColor'];
    borderRadius = json['borderRadius'];
    elevation = json['elevation'];
    logo = json['logo'];
    features = json['features'].cast<int>();
    overView = (json['overView'] != null
        ? new OverView.fromJson(json['overView'])
        : null)!;
    weightGoal = (json['weightGoal'] != null
        ? new WeightGoal.fromJson(json['weightGoal'])
        : null)!;
    centerInformation = (json['centerInformation'] != null
        ? new CenterInformation.fromJson(json['centerInformation'])
        : null)!;
    more = (json['more'] != null ? new More.fromJson(json['more']) : null)!;
    font = (json['font'] != null ? new Font.fromJson(json['font']) : null)!;
    bookings = (json['bookings'] != null
        ? new Bookings.fromJson(json['bookings'])
        : null)!;
    userInfo = (json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['primaryColor'] = this.primaryColor;
    data['secondaryColor'] = this.secondaryColor;
    data['thirdColor'] = this.thirdColor;
    data['backgroundColor'] = this.backgroundColor;
    data['borderRadius'] = this.borderRadius;
    data['elevation'] = this.elevation;
    data['logo'] = this.logo;
    data['features'] = this.features;
    return data;
  }
}

class OverView {
  List<int> overView = [];

  OverView({required this.overView});

  OverView.fromJson(Map<String, dynamic> json) {
    overView = json['overView'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overView'] = this.overView;
    return data;
  }
}

class WeightGoal {
  String imagePath = "";

  WeightGoal({required this.imagePath});

  WeightGoal.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    return data;
  }
}

class CenterInformation {
  bool hasHeatmap = false;

  CenterInformation({required this.hasHeatmap});

  CenterInformation.fromJson(Map<String, dynamic> json) {
    hasHeatmap = json['hasHeatmap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasHeatmap'] = this.hasHeatmap;
    return data;
  }
}

class More {
  bool hasMoreMenu = false;

  More({required this.hasMoreMenu});

  More.fromJson(Map<String, dynamic> json) {
    hasMoreMenu = json['hasMoreMenu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasMoreMenu'] = this.hasMoreMenu;
    return data;
  }
}

class Font {
  String generalFont = "";
  late Header header;
  late Header headerTwo;
  late Header headerThree;

  Font(
      {required this.generalFont,
      required this.header,
      required this.headerTwo,
      required this.headerThree});

  Font.fromJson(Map<String, dynamic> json) {
    generalFont = json['generalFont'];
    header =
        (json['header'] != null ? new Header.fromJson(json['header']) : null)!;
    headerTwo = (json['headerTwo'] != null
        ? new Header.fromJson(json['headerTwo'])
        : null)!;
    headerThree = (json['headerThree'] != null
        ? new Header.fromJson(json['headerThree'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['generalFont'] = this.generalFont;
    return data;
  }
}

class Header {
  String size = "";
  String weight = "";
  String family = "";

  Header({required this.size, required this.weight, required this.family});

  Header.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    weight = json['weight'];
    family = json['family'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['weight'] = this.weight;
    data['family'] = this.family;
    return data;
  }
}

class Bookings {
  String topPicPath = "";
  List<int> bookings = [];
  bool showLocation = false;

  Bookings(
      {required this.topPicPath,
      required this.bookings,
      required this.showLocation});

  Bookings.fromJson(Map<String, dynamic> json) {
    topPicPath = json['topPicPath'];
    bookings = json['bookings'].cast<int>();
    showLocation = json['showLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topPicPath'] = this.topPicPath;
    data['bookings'] = this.bookings;
    data['showLocation'] = this.showLocation;
    return data;
  }
}

class UserInfo {
  String email = "";
  String subscription = "";
  String name = "";
  String lastName = "";
  String profileImage = "";
  String primaryGym = "";
  List<String> secondaryGyms = [];
  String role = "";
  String cardNumber = "";
  String expireYear = "";
  String expireMonth = "";
  int csc = -1;
  String cardholderName = "";
  String issuer = "";

  UserInfo(
      {required this.email,
      required this.subscription,
      required this.name,
      required this.lastName,
      required this.profileImage,
      required this.primaryGym,
      required this.secondaryGyms,
      required this.role,
      required this.cardNumber,
      required this.expireYear,
      required this.expireMonth,
      required this.csc,
      required this.cardholderName,
      required this.issuer});

  UserInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    subscription = json['subscription'];
    name = json['name'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
    primaryGym = json['primaryGym'];
    secondaryGyms = json['secondaryGyms'].cast<String>();
    role = json['role'];
    cardNumber = json['cardNumber'];
    expireYear = json['expireYear'];
    expireMonth = json['expireMonth'];
    csc = json['csc'];
    cardholderName = json['cardholderName'];
    issuer = json['issuer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['subscription'] = this.subscription;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['profileImage'] = this.profileImage;
    data['primaryGym'] = this.primaryGym;
    data['secondaryGyms'] = this.secondaryGyms;
    data['role'] = this.role;
    data['cardNumber'] = this.cardNumber;
    data['expireYear'] = this.expireYear;
    data['expireMonth'] = this.expireMonth;
    data['csc'] = this.csc;
    data['cardholderName'] = this.cardholderName;
    data['issuer'] = this.issuer;
    return data;
  }
}
