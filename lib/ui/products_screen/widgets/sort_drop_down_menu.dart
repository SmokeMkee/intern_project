
import 'package:flutter/material.dart';

class SortDropDownMenu extends StatefulWidget {
  const SortDropDownMenu({Key? key}) : super(key: key);

  @override
  State<SortDropDownMenu> createState() => _SortDropDownMenuState();
}

class _SortDropDownMenuState extends State<SortDropDownMenu> {

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Sort: asc", child: Text("Sort: asc")),
      DropdownMenuItem(value: "Sort: desc", child: Text("Sort: desc")),
    ];
    return menuItems;
  }
  String selectedValue = "Sort: asc";


  @override
  Widget build(BuildContext context) {
    return DropdownButton(
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
