import 'package:flutter/material.dart';
import 'package:webspark_test/app/app.dart';
import 'package:webspark_test/app/router/app_router.dart';

// import 'package:webspark_test/core/di/locator.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await configureDependencies();

  final router = AppRouter.create();

  runApp(App(router: router));
}
