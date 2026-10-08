import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webspark_test/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Webspark Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
