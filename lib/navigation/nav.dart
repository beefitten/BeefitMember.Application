import 'package:flutter/material.dart';
import 'package:beefitmember_application/overview.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Overview(),
    Text("Strong"),
    Text("Calender"),
    Text("More"),
  ];

  void onItemTap(int index){
    setState(() {
      if (index > 3)
        _selectedIndex = 4;
      else
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
      bottomNavigationBar: BottomNavigationBar(
        iconSize: MediaQuery.of(context).size.height*0.03,
        type: BottomNavigationBarType.fixed,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed:(){
          onItemTap(4);
        },
        tooltip: 'Increment',
        backgroundColor: Color.fromRGBO(6,62,249,1),
        child: new Icon(Icons.add),
      ),
    );
  }
}