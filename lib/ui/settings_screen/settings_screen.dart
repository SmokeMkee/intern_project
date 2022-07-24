import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../generated/l10n.dart';
import '../../repo/repo_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgColorAppBar,
        title: Text(
          S.of(context).settings,
          // S.of(context).settings,
          style: AppStyles.s20w500,
        ),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('${S.of(context).language}: '),
              DropdownButton<String>(
                value: Intl.getCurrentLocale(),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(S.of(context).english
                        // S.of(context).english,
                        ),
                  ),
                  DropdownMenuItem(
                    value: 'ru_RU',
                    child: Text(S.of(context).russian
                        // S.of(context).russian,
                        ),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  if (value == 'ru_RU') {
                    S.load(
                      const Locale('ru', 'RU'),
                    );
                    setState(() {});
                  } else if (value == 'en') {
                    S.load(
                      const Locale('en'),
                    );
                    setState(() {});
                  }
                  final repoSettings =
                      Provider.of<RepoSettings>(context, listen: false);
                  repoSettings.saveLocale(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
