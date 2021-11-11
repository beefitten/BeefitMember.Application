import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookings_page.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_bloc.dart';
import 'package:beefitmember_application/center_information/service/center_information_service.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_state.dart';
import 'package:beefitmember_application/bookings/services/appointments_service.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_bloc.dart';
import 'package:beefitmember_application/training_progression/services/weightgoal_service.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_state.dart';
import 'package:beefitmember_application/bookings/services/bookings_service.dart';
import 'package:beefitmember_application/user/bloc/login_bloc.dart';
import 'package:beefitmember_application/user/bloc/login_state.dart';
import 'package:beefitmember_application/user/pages/Contact.dart';

import 'package:beefitmember_application/navigation/nav.dart';
import 'package:beefitmember_application/user/pages/login/login_form.dart';
import 'package:beefitmember_application/user/pages/pre_login/pre_login.dart';
import 'package:beefitmember_application/user/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bookings/bloc/bookingsList/bookings_list_bloc.dart';
import 'bookings/bloc/bookingsList/bookings_list_state.dart';
import 'bookings/pages/yourbookings/widgets/my_bookings.dart';
import 'training_progression/bloc/weightgoal_states.dart';
import 'user/pages/pre_login/pre_login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBLoc(LoginInitState(), LoginService())),
        BlocProvider(
            create: (context) =>
                CenterInformationBloc(CenterInformationService())),
        BlocProvider(
            create: (context) =>
                WeightGoalBloc(WeightGoalInitState(), WeightGoalService())),
        BlocProvider(
            create: (context) => LoginBLoc(LoginInitState(), LoginService())),
        BlocProvider(
            create: (context) =>
                BookingBloc(BookingInitState(), BookingsService())),
        BlocProvider(
            create: (context) =>
                BookingListBloc(BookingListInitState(), BookingsService())),
        BlocProvider(
            create: (context) => AppointmentsBloc(
                AppointmentsInitState(), AppointmentsService())),
      ],
      child: MaterialApp(
        title: 'Beefit Member',
        routes: {
          '/': (context) => PreLogin(),
          '/contacts': (context) => Contact(),
          '/login': (context) => Login(),
          '/nav': (context) => Nav(),
          '/bookings': (context) => BookingsPage()
        },
      ),
    );
  }
}
