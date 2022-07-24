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
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(AppAssets.images.logo),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginTextFormField(
                    controller: loginController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextFormField(
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 20,
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
          ],
        ),
      ),
    );
  }
}
