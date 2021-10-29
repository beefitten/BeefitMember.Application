import 'package:beefitmember_application/bookings/bloc/bookingsList/bookings_list_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/bookingsList/bookings_list_events.dart';
import 'package:beefitmember_application/bookings/bloc/bookingsList/bookings_list_state.dart';
import 'package:beefitmember_application/bookings/pages/bookings_list/booking_card.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ClassesList extends StatefulWidget {
  const ClassesList({Key? key}) : super(key: key);

  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
  bool _isBooked = false;
  List<Classes>? _allClasses;
  List<Classes>? _yourBookings;
  late BookingListBloc bookingListBloc;

  @override
  void initState() {
    bookingListBloc = BlocProvider.of<BookingListBloc>(context);
    super.initState();
  }

  handleBook() {
    setState(() {
      _isBooked = !_isBooked;
    });
  }

  alreadyBooked(Classes currentClass) {
    for (Classes item in _yourBookings!) {
      if (item.classId == currentClass.classId) return true;
    }
    return false;
  }

  setVariables(List<Classes> yourBookings, List<Classes> allClasses) {
    _yourBookings = yourBookings;
    _allClasses = allClasses;
  }

  @override
  Widget build(BuildContext context) {
    bookingListBloc.add(BookingListLoadingEvent(
        primaryGym: User.primaryGym, email: User.email));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        BlocBuilder<BookingListBloc, BookingListState>(
            builder: (context, state) {
          if (state is BookingListLoadingState)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor:
                    Color(int.parse(FitnessPackage.model.primaryColor)),
              ),
            );
          if (state is BookingListSuccessState) {
            setVariables(state.yourBookings, state.allBookings);
            return Expanded(
              child: _allClasses!.length == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(child: Text("You have no classes booked!")))
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            child: BookingCard(
                              className: _allClasses![index].className,
                              timeStart: DateFormat.Hm()
                                  .format(_allClasses![index].timeStart),
                              timeEnd: DateFormat.Hm()
                                  .add_MMMd()
                                  .format(_allClasses![index].timeEnd),
                              place: _allClasses![index].location,
                              classInfo: _allClasses![index],
                              email: User.email,
                              booked: alreadyBooked(_allClasses![index]),
                            ),
                            onTap: () {});
                      },
                      itemCount: _allClasses!.length,
                    ),
            );
          } else if (state is BookingListErrorState) {
            return Text(state.message);
          }
          return Container();
        })
      ]),
    );
  }
}
