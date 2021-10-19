import 'package:http/http.dart' as http;

class BookingService {
  getBookings(String fitnessName) async {
    var endpointUrl = Uri.parse("https://10.0.2.2:5001/getClasses?fitnessName=fitnessX");

    var response = await http.get(endpointUrl);

    print(response);
  }
}