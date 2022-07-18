import 'package:flutter/material.dart';

class CategoryDropDownMenu extends StatefulWidget {
  const CategoryDropDownMenu({Key? key}) : super(key: key);

  @override
  State<CategoryDropDownMenu> createState() => _CategoryDropDownMenuState();
}

class _CategoryDropDownMenuState extends State<CategoryDropDownMenu> {

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Category", child: Text("Category")),
      DropdownMenuItem(value: "electronics", child: Text("electronics")),
      DropdownMenuItem(value: "jewelery", child: Text("jewelery")),
      DropdownMenuItem(value: "men's clothing", child: Text("men's clothing")),
      DropdownMenuItem(value: "women's clothing", child: Text("women's clothing")),
    ];
    return menuItems;
  }

  String selectedValue = "Category";


  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
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
