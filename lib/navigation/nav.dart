import 'package:beefitmember_application/utils/refreshRate.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text("home"),
    Text("Strong"),
    Text("Add"),
    Text("Calender"),
    Text("More"),
  ];

  void onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text("Bottom Nav Bar"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          iconSize: MediaQuery.of(context).size.height*0.035,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Overview")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                title: Text("Strong")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                title: Text("Plus")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text("Calender")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                title: Text("More")
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onItemTap,
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromRGBO(6,62,249,1),
        ),
      ),
    );
  }
}