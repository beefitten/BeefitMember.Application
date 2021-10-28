import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

class BookingsService {
  getAllClasses(String primaryGym, String email) async {
    List<Classes>? _allClasses;
    List<Classes>? _yourBookings;

    // All classes
    var fitness = primaryGym;
    var allClassesUrl = Uri.parse('https://bfmbookings.azurewebsites.net/getClasses/$fitness');
    var allClassesResponse = await http.get(allClassesUrl);
    List<dynamic> allClassesBody = cnv.jsonDecode(allClassesResponse.body);
    _allClasses = allClassesBody.map((dynamic item) => Classes.fromJson(item)).toList();


    // Your bookings
    var userEmail = email;
    var yourBookingsUrl = Uri.parse('https://bfmbookings.azurewebsites.net/getUserClasses/$userEmail');
    var yourBookingsResponse = await http.get(yourBookingsUrl);
    List<dynamic> yourBookingBody = cnv.jsonDecode(yourBookingsResponse.body);
    _yourBookings = yourBookingBody.map((dynamic item) => Classes.fromJson(item)).toList();

    List<List> lists = [];
    lists.add(_yourBookings);
    lists.add(_allClasses);

    return lists;
  }

  getBookings(String email) async {
    var userEmail = email;
    var endpointUrl = Uri.parse('https://bfmbookings.azurewebsites.net/getUserClasses/$userEmail');

    var response = await http.get(endpointUrl);

    List<dynamic> body = cnv.jsonDecode(response.body);
    return body.map((dynamic item) => Classes.fromJson(item)).toList();
  }
}