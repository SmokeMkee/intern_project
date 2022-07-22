import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class CategoryDropDownMenu extends StatelessWidget {
  const CategoryDropDownMenu(
      {Key? key, required this.onChanged, required this.selectedValue})
      : super(key: key);

  final ValueChanged<String?>? onChanged;
  final String selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      onChanged: onChanged,
      items: [
        DropdownMenuItem(
          value: "Category",
          child: Text(S.of(context).category),
        ),
        DropdownMenuItem(
          value: "electronics",
          child: Text(S.of(context).electronics),
        ),
        DropdownMenuItem(
          value: "jewelery",
          child: Text(S.of(context).jewelery),
        ),
        DropdownMenuItem(
          value: "men's clothing",
          child: Text(S.of(context).menClothing),
        ),
        DropdownMenuItem(
          value: "women's clothing",
          child: Text(S.of(context).womenClothing),
        ),
      ],
    );
  }
}
