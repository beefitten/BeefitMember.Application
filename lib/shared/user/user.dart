class User {
  static final User _instance = User._internal();
  static String email = "Default User";
  static String subscription = "";
  static String name = "";
  static String primaryGym = "";
  static List<String> secondaryGymsList = [];
  static String role = "";

  static String cardNumber = "";
  static String expireYear = "";
  static String expireMonth = "";
  static int csc = -1;
  static String cardHolderName = "";
  static String issuer = "";

  factory User() {
    return _instance;
  }

  User._internal() {
    // initialization logic
  }
  void update(dynamic json) {
    print(json);
    email = json['email'].toString();
    subscription = json['subscription'].toString();
    name = json['name'].toString();
    primaryGym = json['primaryGym'].toString();
    List<dynamic> secondaryGyms = json['secondaryGyms'];
    secondaryGymsList = secondaryGyms.cast<String>();

    role = json['role'].toString();
    cardNumber = json['cardnumber'].toString();
    expireYear = json['expireYear'].toString();
    expireMonth = json['expireMonth'].toString();

    csc = int.parse(json['csc']);

    cardHolderName = json['cardHolderName'].toString();
    issuer = json['issuer'].toString();
  }
}
