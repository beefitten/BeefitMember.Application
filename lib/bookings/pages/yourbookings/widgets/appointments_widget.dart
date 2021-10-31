import 'package:beefitmember_application/bookings/bloc/appointments/appointments_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_state.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentsWidget extends StatefulWidget {
  final _color;
  final TextStyle fontFamily =
      GoogleFonts.getFont(FitnessPackage.model.font.generalFont);

  AppointmentsWidget([this._color = Colors.white]);

  @override
  State<AppointmentsWidget> createState() => _AppointmentsWidgetState();
}

class _AppointmentsWidgetState extends State<AppointmentsWidget> {
  late AppointmentsBloc appointmentsBloc;

  @override
  void initState() {
    appointmentsBloc = BlocProvider.of<AppointmentsBloc>(context);
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  static generateList(AppointmentsSuccessState state) {
    List<Widget> _widgetOptions = <Widget>[];

    state.appointments.forEach((element) {
      _widgetOptions
          .add(BookingExample(element.headline, element.date, element.image));
    });

    return _widgetOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AppointmentsBloc, AppointmentsState>(
          builder: (context, state) {
            if (state is AppointmentsSuccessState)
              return Container(
                  color: Colors.white,
                  child: state.appointments.length == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text("You have no appointments booked!"),
                          ),
                        )
                      : Column(children: generateList(state)));
            else if (state is AppointmentsErrorState) {
              return Text(state.message);
            }
            return Container();
          },
        ),
      ],
    );
  }
}

class BookingExample extends StatelessWidget {
  final _title;
  final _date;
  final _picture;
  final _color;

  BookingExample(this._title, this._date, this._picture,
      [this._color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Card(
            elevation: 3,
            color: _color,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                        radius: 30, backgroundImage: NetworkImage(_picture)),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _title,
                          style: GoogleFonts.getFont(
                            FitnessPackage.model.font.generalFont,
                            fontSize: 18, 
                            fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _date,
                          style: GoogleFonts.getFont(
                            FitnessPackage.model.font.generalFont,
                            fontSize: 15, color: 
                            Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
