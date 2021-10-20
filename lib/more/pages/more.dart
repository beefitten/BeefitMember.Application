import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/overview/pages/overview/overview.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/training_progression/pages/training_progression.dart';
import 'package:beefitmember_application/training_progression/preview/training_prog_preview.dart';
import 'package:beefitmember_application/user/service/logout_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  final _logOut = Text(
    'Log out',
    style: TextStyle(
        fontSize: 20.0, color: Color(int.parse(FitnessPackage.secondaryColor))),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _logOutBtn = TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(229, 235, 254, 1.0))),
      child: _logOut,
      onPressed: () {
        LogoutService.logOut();
        Navigator.pop(context, '/nav');
      },
    );

    final headerGeneral = (String txt) => Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.44),
          child: Text(
            "$txt",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );

    final membership = Container(
      child: Row(
        children: [headerGeneral("Membership"), ShowMore()],
      ),
    );

    final card = (double height,Icon icon ,String txt) => Container(
      height: height,
      width: MediaQuery.of(context).size.width * 0.42,
      margin: EdgeInsets.only(
          bottom: 8.0, right: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 252, 1),
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),
              child: Text(
                txt, 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14),),
            )],
        ),
      ),
    );

    final more = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerGeneral("More"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    card(100,Icon(Icons.watch_later, size: 36,) ,"Watches and Scales"),
                    card(100,Icon(Icons.watch_later, size: 36,) ,"Watches and Scales"),
                    card(100,Icon(Icons.watch_later, size: 36,) ,"Watches and Scales"),
                    card(100,Icon(Icons.watch_later, size: 36,) ,"Watches and Scales"),
                    card(100,Icon(Icons.watch_later, size: 36,) ,"Watches and Scales"),
                    card(100,Icon(Icons.watch_later, size: 36,) ,"Watches and Scales"),
                  ],
                ),
                Column(
                  children: [
                    card(85,Icon(Icons.mobile_friendly, size: 36,) ,"Integrations"),
                    card(85,Icon(Icons.mobile_friendly, size: 36,) ,"Integrations"),
                    card(85,Icon(Icons.mobile_friendly, size: 36,) ,"Integrations"),
                    card(85,Icon(Icons.mobile_friendly, size: 36,) ,"Integrations"),
                    card(85,Icon(Icons.mobile_friendly, size: 36,) ,"Integrations"),
                    card(85,Icon(Icons.mobile_friendly, size: 36,) ,"Integrations"),
                    card(85,Icon(Icons.mobile_friendly, size: 36,) ,"Integrations"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

    final membershipCard = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Color.fromRGBO(247, 247, 252, 1) // whitelabelin color
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width *0.04, left: MediaQuery.of(context).size.width *0.02),
              child: Icon(Icons.beach_access,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Medlemsskab A"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Bindsperiode: 6 måneder"),
                )
              ],
            )
          ],
        ),
      ),
    );

    final backgroundCurve = Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 252, 1),
          borderRadius: new BorderRadius.vertical(
              bottom: new Radius.elliptical(
                  MediaQuery.of(context).size.width, 90))),
    );

    final profileInfo = Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.32,
            top: MediaQuery.of(context).size.height * 0.01),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROy2NZIldQXwZCIOka2hb-jtPEpTBcipkyVA&usqp=CAU')
            ),
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02), child: Column(
                children: [
                  Text("Jonas West Alrø"),
                  Text(
                    "Member since Aug 2018",
                    style: TextStyle(color: Color.fromRGBO(138, 141, 178, 1)),
                  )
                ],
              ),
            )
            
          ],
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: ListView(
          children: [
            Stack(
              children: [
                backgroundCurve,
                profileInfo
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
              child: membership,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: membershipCard,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,),
              child: more,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child: _logOutBtn,
            )
          ],
        )));
  }
}
