import 'package:beefitmember_application/bookings/bloc/appointments/appointments_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_events.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_state.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_bloc.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_events.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_state.dart';
import 'package:beefitmember_application/bookings/pages/previewBookings/preview_bookings.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/your_classes_widget.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_bloc.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_events.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_state.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/overview/widgets/parallax_app_bar.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:beefitmember_application/training_progression/preview/training_prog_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Overview extends StatefulWidget {
  @override
  OverviewState createState() => OverviewState();
}

class OverviewState extends State<Overview>
    with SingleTickerProviderStateMixin {
  List<Widget> _overViewPreviews = generateOverviews();
  late AppointmentsBloc appointmentsBloc;
  late BookingBloc bookingBloc;
  late CenterInformationBloc centerInfoBloc;

  @override
  void initState() {
    appointmentsBloc = BlocProvider.of<AppointmentsBloc>(context);
    appointmentsBloc.add(AppointmentsLoadingEvent());
    bookingBloc = BlocProvider.of<BookingBloc>(context);
    bookingBloc.add(BookingLoadingEvent(email: User.email));
    centerInfoBloc = BlocProvider.of<CenterInformationBloc>(context);
    centerInfoBloc.add(LoadEvent(fitnessName: FitnessPackage.model.name));

    super.initState();
  }

  static generateOverviews() {
    var _orderList = FitnessPackage.model.overView.overView;
    List<Widget> _widgetOptions = <Widget>[];

    _orderList.forEach((element) {
      switch (element) {
        case 0:
          _widgetOptions.add(Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: PreviewBookings(true),
          ));
          break;
        case 1:
          _widgetOptions.add(Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: YourClassesWidget(),
          ));
          break;
        case 2:
          _widgetOptions.add(Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: TrainingProgPreview(),
          ));
          break;
        case 3:
          _widgetOptions.add(Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: BlocBuilder<CenterInformationBloc, CenterInformationState>(
              builder: (context, state) {
                if (state is InfoLoadedState) {
                  return CenterInformationHeatMap(state.model);
                }
                return CircularProgressIndicator();
              },
            ),
          ));
          break;
      }
    });

    return _widgetOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        body: BlocBuilder<AppointmentsBloc, AppointmentsState>(
          builder: (context, state) {
            if (state is AppointmentsLoadingState) {
              return loadingScreen();
            }
            if (state is AppointmentsSuccessState)
              return BlocBuilder<BookingBloc, BookingsState>(
                builder: (context, state) {
                  if (state is BookingLoadingState) {
                    return loadingScreen();
                  }
                  if (state is BookingSuccessState) return listOfData();

                  return Container();
                },
              );

            return Container();
          },
        ),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[ParallaxAppBar()];
        },
      ),
    );
  }

  loadingScreen() {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: Color(int.parse(FitnessPackage.model.primaryColor)),
    ));
  }

  listOfData() {
    return ScrollConfiguration(
      behavior: ScrollSetup(),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: ListView(
              children: _overViewPreviews,
            ),
          ),
        ),
      ),
    );
  }
}

class ScrollSetup extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
