import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_project/bloc/products/bloc_products.dart';
import 'package:intern_project/repo/api.dart';
import 'package:intern_project/repo/repo_products.dart';
import 'package:intern_project/repo/repo_settings.dart';
import 'package:provider/provider.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        Provider(
          create: (context) => RepoSettings(),
        ),
        Provider(
          create: (context) => RepoProducts(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => BlocProducts(
            repo: RepositoryProvider.of<RepoProducts>(context),
          )..add(
            EventProductsFilter('asc'),
          ),
        ),
      ], child: child),
    );
  }
}
