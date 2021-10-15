import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class Filter extends StatefulWidget {
  final List<String> items;
  final String? value;

  Filter({Key? key, required this.items, this.value}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String? value = "";

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Color.fromRGBO(247, 247, 252, 1)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(45, 4, 0, 4),
          child: DropdownButton<String>(
            value: widget.value,
            items: widget.items.map(buildMenuItem).toList(),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            isExpanded: true,
            onChanged: (value) => setState(() => this.value = widget.value),
          ),
        ),
      ),
    );
  }
}
