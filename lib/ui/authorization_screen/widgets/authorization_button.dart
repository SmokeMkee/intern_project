import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intern_project/constants/app_colors.dart';
import 'package:intern_project/constants/app_styles.dart';

class AuthorizationButton extends StatelessWidget {
  const AuthorizationButton(
      {Key? key,
      required this.loginController,
      required this.context,
      required this.passwordController,
      required this.formKey})
      : super(key: key);

  final TextEditingController loginController;
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;

  void onPressedButton(String login, String password) {
    if (login == 'qwerty' && password == '123456ab') {
      Navigator.of(context).pushReplacementNamed('/auth_screen/navigation_bar');
    } else {
      if (kDebugMode) {
        print("incorrect");
      }
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return const AlertDialogs();
      //   },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: AppColors.authorizationButtonBGColor,
              primary: AppColors.authorizationButtonBGColor,
              elevation: 6,
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onPressedButton(loginController.text, passwordController.text);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Sign in',
                style: AppStyles.s16w400.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
