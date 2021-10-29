import 'package:beefitmember_application/bookings/bloc/appointments/appointments_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_events.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_state.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_events.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_state.dart';
import 'package:beefitmember_application/bookings/pages/previewBookings/preview_bookings.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/your_classes_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/findClasses_widget.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourBookings extends StatefulWidget {
  @override
  _YourBookingsState createState() => _YourBookingsState();
}

class _YourBookingsState extends State<YourBookings> {
  final _widgets = generateOrder();

  late BookingBloc bookingBloc;
  late AppointmentsBloc appointmentsBloc;
  final int primaryColor = int.parse(FitnessPackage.model.primaryColor);

  void initState() {
    appointmentsBloc = BlocProvider.of<AppointmentsBloc>(context);
    bookingBloc = BlocProvider.of<BookingBloc>(context);
    appointmentsBloc.add(AppointmentsLoadingEvent());
    bookingBloc.add(BookingLoadingEvent(email: User.email));

    super.initState();
  }

  static generateOrder() {
    var orderList = FitnessPackage.model.bookings.bookings;
    List<Widget> _widgetOptions = <Widget>[];

    _widgetOptions.add(FindClassesWidget());

    orderList.forEach((element) {
      switch (element) {
        case 0:
          _widgetOptions.add(YourClassesWidget());
          break;
        case 1:
          _widgetOptions.add(PreviewBookings());
          break;
      }
    });

    return _widgetOptions;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingsState>(
      builder: (context, state) {
        if (state is BookingLoadingState)
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Color(primaryColor),
          ));
        if (state is BookingSuccessState)
          return BlocBuilder<AppointmentsBloc, AppointmentsState>(
              builder: (context, state) {
            if (state is AppointmentsLoadingState)
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Color(primaryColor),
              ));
            if (state is AppointmentsSuccessState)
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView(children: _widgets),
              );
            return Container();
          });
        return Container();
      },
    );
  }
}
