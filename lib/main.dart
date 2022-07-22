import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intern_project/init_widget.dart';
import 'package:intern_project/repo/repo_settings.dart';
import 'package:intern_project/ui/authorization_screen/authorization_screen.dart';
import 'package:intern_project/ui/navigation/navigation.dart';
import 'package:intern_project/ui/product_details_screen/product_details_screen.dart';
import 'package:intern_project/ui/splash_screen/splash_screen.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repoSettings = RepoSettings();
  await repoSettings.init();
  var defaultLocale = const Locale('ru', 'RU');
  final locale = await repoSettings.readLocale();
  if (locale == 'en') {
    defaultLocale = const Locale('en');
  }

  runApp(
    InternProject(
      locale: defaultLocale,
    ),
  );
}

class InternProject extends StatelessWidget {
  const InternProject({Key? key, required this.locale}) : super(key: key);
  final Locale locale;
  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/auth_screen': (context) => const AuthorizationScreen(),
          '/auth_screen/navigation_bar': (context) => const Navigation(),
          '/auth_screen/navigation_bar/products/product_details': (context) =>
              const ProductDetailsScreen(),
        },
        initialRoute: '/auth_screen/navigation_bar',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: locale,
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
