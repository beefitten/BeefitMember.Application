import 'package:beefitmember_application/bookings/bloc/bookings_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_state.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_events.dart';

class BookingWidget extends StatefulWidget {
  BookingWidget();

  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  late BookingBloc bookingBloc;

  @override
  void initState() {
    bookingBloc = BlocProvider.of<BookingBloc>(context);
    bookingBloc.add(BookingLoadingEvent(email: User.email));
    print("Tes");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Your Bookings",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<BookingBloc, BookingsState>(builder: (context, state) {
          if (state is BookingLoadingState)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor:
                    Color(int.parse(FitnessPackage.model.primaryColor)),
              ),
            );
          if (state is BookingSuccessState)
            return Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.26,
              child: state.bookings.length == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(child: Text("You have no classes booked!")))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CardExample(
                            state.bookings[index].classImage,
                            state.bookings[index].className,
                            state.bookings[index].location,
                            DateFormat.Hm()
                                .add_E()
                                .add_MMMd()
                                .format(state.bookings[index].timeStart));
                      },
                      itemCount: state.bookings.length,
                    ),
            );
          else if (state is BookingErrorState) {
            return Text(state.message);
          }
          return Container();
        })
      ]),
    );
  }
}

class CardExample extends StatelessWidget {
  final _picture;
  final _title;
  final _subtitle;
  final _date;

  CardExample(this._picture, this._title, this._subtitle, this._date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_picture),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color:
                          Color(int.parse(FitnessPackage.model.secondaryColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _date,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 6),
                child: Text(_title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(_subtitle, style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
