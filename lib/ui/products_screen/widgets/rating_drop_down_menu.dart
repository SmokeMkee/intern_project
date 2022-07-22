import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class RatingDropDownMenu extends StatelessWidget {
  const RatingDropDownMenu(
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
          value: "1",
          child: Text(S.of(context).ratingAll),
        ),
        const DropdownMenuItem(
          value: "2",
          child: Text("2"),
        ),
        const DropdownMenuItem(
          value: "3",
          child: Text("3"),
        ),
        const DropdownMenuItem(
          value: "4",
          child: Text("4"),
        ),
        const DropdownMenuItem(
          value: "5",
          child: Text("5"),
        ),
      ],
    );
  }
}
