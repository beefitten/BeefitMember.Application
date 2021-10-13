import 'package:flutter/material.dart';

class AppBarCurve extends ShapeBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    
    path.moveTo(0, rect.height * 0.80);
    path.quadraticBezierTo(
        rect.width / 2, rect.height, rect.width, rect.height*0.80);

    path.lineTo(rect.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {

  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}

final silverBar =  SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 150.0,
      backgroundColor: Color.fromARGB(255, 75, 120, 255),
      shape: AppBarCurve(),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: Text('')),
      flexibleSpace: Container(
        child: FlexibleSpaceBar(
          title: Text('Beefit', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0),
          ),
          centerTitle: true),
      ),
    );

final silverL = SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100*(index % 9)],
              child: Text('List Item $index')  
            );
          }
        ), 
        itemExtent: 50);


final listIteration1 = SliverList(delegate: 
SliverChildBuilderDelegate( (context, index) {
  return Container(
    alignment: Alignment.center,
    color: Colors.teal,
    child: Text('grid item $index')
  );
}, childCount: 100));

final listIteration2 = SliverFillRemaining(
  child: Center(
    child: ListView(
      children: [
        Center(child: Text('data')),
        Center(child: TestWdiget()),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        Center(child: Text('data')),
        
       ]
    )
  ),
);

final appBar = CustomScrollView(
  slivers: <Widget>[
    silverBar,
    listIteration2],
);

class Overview extends StatelessWidget {
  const Overview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: appBar,
      )
    );
  }
}

class TestWdiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('TestApp')
    );
  }

}