import 'package:flutter/material.dart';
import 'package:intern_project/constants/app_assets.dart';
import 'package:intern_project/ui/authorization_screen/widgets/authorization_button.dart';
import 'package:intern_project/ui/authorization_screen/widgets/login_text_form_field.dart';
import 'package:intern_project/ui/authorization_screen/widgets/password_text_form_field.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(AppAssets.images.noAvatar),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginTextFormField(
                      controller: loginController,
                    ),
                    PasswordTextFormField(
                      controller: passwordController,
                    ),
                    AuthorizationButton(
                      loginController: loginController,
                      passwordController: passwordController,
                      context: context,
                      formKey: _formKey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
