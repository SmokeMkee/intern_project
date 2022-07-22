import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SortDropDownMenu extends StatelessWidget {
  const SortDropDownMenu(
      {Key? key, required this.onChanged, required this.selectedValue})
      : super(key: key);

  final String selectedValue;
  final ValueChanged<String?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      onChanged: onChanged,
      items: [
        DropdownMenuItem(
          value: "asc",
          child: Text(S.of(context).asc),
        ),
        DropdownMenuItem(
          value: "desc",
          child: Text(S.of(context).desc),
        ),
      ],
    );
  }
}
