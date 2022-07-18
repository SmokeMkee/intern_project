import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: 'Login',
        hintStyle: AppStyles.s16w400,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        filled: true,
        fillColor: AppColors.loginAndPasswordBGColor,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        if (value.length < 3) {
          return '';
        }
        if (value.length > 8) {
          return '';
        }

        return null;
      },
      onTap: () {},
    );
  }
}
