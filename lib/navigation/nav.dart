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

  List<Widget> _widgetOptions = generateFeatures(FitnessPackage.features);

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
            items: generateIcons(FitnessPackage.features),
            currentIndex: _selectedIndex,
            onTap: onItemTap,
            backgroundColor: Colors.white,
            selectedItemColor: Color(int.parse(FitnessPackage.primaryColor)),
          ),
        ),
      ),
    );
  }

  static List<Widget> generateFeatures(List<int> featureList) {
    List<Widget> _widgetOptions = <Widget>[
      Overview()
    ];

    featureList.forEach((element) {
      switch(element){
        case 0:
          _widgetOptions.add(BookingMenuWidget());
          break;
        case 1:
          _widgetOptions.add(TrainingProgression());
          break;
        case 2:
          _widgetOptions.add(CenterInformation());
          break;
      }
    });

    _widgetOptions.add(More());
    return _widgetOptions;
  }

  static List<BottomNavigationBarItem> generateIcons(List<int> featureList) {
    List<BottomNavigationBarItem> _navigationBarList = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Overview",
      ),
    ];

    featureList.forEach((element) {
      switch(element){
        case 0:
          _navigationBarList.add(BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Bookings",
          ));
          break;
        case 1:
          _navigationBarList.add(BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Weight Goal",
          ),);
          break;
        case 2:
          _navigationBarList.add(BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: "Information",
          ));
          break;
      }
    });

    _navigationBarList.add(BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: "More",
    ));

    return _navigationBarList;
  }
}

