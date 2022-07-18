
import 'package:flutter/material.dart';

class RatingDropDownMenu extends StatefulWidget {
  const RatingDropDownMenu({Key? key}) : super(key: key);

  @override
  State<RatingDropDownMenu> createState() => _RatingDropDownMenuState();
}

class _RatingDropDownMenuState extends State<RatingDropDownMenu> {
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = const [
       DropdownMenuItem(value: "Rating : all", child: Text("Rating : all")),
       DropdownMenuItem(value: "2", child: Text("2")),
       DropdownMenuItem(value: "3", child: Text("3")),
       DropdownMenuItem(value: "4", child: Text("4")),
       DropdownMenuItem(value: "5", child: Text("5")),
    ];
    return menuItems;
  }

   String selectedValue = "Rating : all";

  @override
  Widget build(BuildContext context) {
    return   DropdownButton(
        value: selectedValue,
        onChanged: (String? newValue){
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems
    );
  }
}
