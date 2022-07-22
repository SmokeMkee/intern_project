import 'package:flutter/material.dart';
import 'package:intern_project/constants/app_assets.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../repo/repo_settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final repoSettings = Provider.of<RepoSettings>(
      context,
      listen: false,
    );
    repoSettings.init().whenComplete(
      () async {
        var defaultLocale = const Locale('ru', 'RU');
        final locale = await repoSettings.readLocale();
        if (locale == 'en') {
          defaultLocale = const Locale('en');
        }
        S.load(defaultLocale).whenComplete(
          () {
            Navigator.of(context).pushReplacementNamed('/auth_screen');
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.images.noAvatar), fit: BoxFit.cover),
      ),
    );
  }
}
