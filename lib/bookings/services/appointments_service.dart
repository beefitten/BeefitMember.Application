import 'package:beefitmember_application/bookings/pages/yourbookings/models/appointmentModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

class AppointmentsService {
  getAppointments() async {
    var endpointUrl = Uri.parse('https://beefitmemberbookings.azurewebsites.net/getRandomAppointments');

    var response = await http.get(endpointUrl);

    List<dynamic> body = cnv.jsonDecode(response.body);
    return body.map((dynamic item) => Appointments.fromJson(item)).toList();
  }
}