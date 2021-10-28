class User {
  static final User _instance = User._internal();
  static String email = "Default User";
  static String subscription = "";
  static String name = "";
  static String lastName = "";
  static String primaryGym = "";
  static List<String> secondaryGymsList = [];
  static String role = "";
  static String profileImage = "";

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
    email = json['userInfo']['email'].toString();
    subscription = json['userInfo']['subscription'].toString();
    name = json['userInfo']['name'].toString();
    lastName = json['userInfo']['lastName'].toString();
    primaryGym = json['userInfo']['primaryGym'].toString();
    List<dynamic> secondaryGyms = json['userInfo']['secondaryGyms'];
    secondaryGymsList = secondaryGyms.cast<String>();
    profileImage = json['userInfo']['profileImage'].toString();

    role = json['userInfo']['role'].toString();
    cardNumber = json['userInfo']['cardnumber'].toString();
    expireYear = json['userInfo']['expireYear'].toString();
    expireMonth = json['userInfo']['expireMonth'].toString();

    csc = int.parse(json['userInfo']['csc'].toString());

    cardHolderName = json['userInfo']['cardHolderName'].toString();
    issuer = json['userInfo']['issuer'].toString();
  }
}
