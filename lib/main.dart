import 'package:beefitmember_application/bookings/services/booking_service.dart';
import 'package:beefitmember_application/user/bloc/login_bloc.dart';
import 'package:beefitmember_application/user/bloc/login_state.dart';
import 'package:beefitmember_application/user/pages/Contact.dart';

import 'package:beefitmember_application/navigation/nav.dart';
import 'package:beefitmember_application/user/pages/login/login_form.dart';
import 'package:beefitmember_application/user/pages/pre_login/pre_login.dart';
import 'package:beefitmember_application/user/service/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookings/pages/yourbookings/your_bookings.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBLoc(LoginInitState(), LoginService()))
      ],
      child: MaterialApp(
        title: 'Beefit Member',
        routes: {
          '/': (context) => PreLogin(),
          '/contacts': (context) => Contact(),
          '/login': (context) => Login(),
          '/nav': (context) => Nav(),
          '/bookings': (context) => YourBookings()
        },
      ),
    );
  }
}


