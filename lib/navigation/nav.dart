import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/booking_menu_widget.dart';
import 'package:beefitmember_application/center_information/center_information.dart';
import 'package:beefitmember_application/more/pages/more.dart';
import 'package:beefitmember_application/overview/overview.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/training_progression/pages/training_progression.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  void initState() {
    super.initState();
    print("Init nav");
  }

  @override
  void dispose() {
    super.dispose();
    print("Dispose nav");
  }

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Overview(),
    TrainingProgression(),
    CenterInformation(),
    BookingMenuWidget(),
    More(),
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          iconSize: MediaQuery.of(context).size.height * 0.035,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Overview",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: "Strong",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: "Plus",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Calender",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "More",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onItemTap,
          backgroundColor: Colors.white,
          selectedItemColor: Color(int.parse(FitnessPackage.primaryColor)),
        ),
      ),
    );
  }
}
