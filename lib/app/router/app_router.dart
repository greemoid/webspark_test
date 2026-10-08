import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:webspark_test/app/router/app_routes.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/url_input_screen.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/process_screen.dart';

abstract final class AppRouter {
  static GoRouter create() {
    return GoRouter(
      initialLocation: AppRoutes.urlInput,
      routes: [
        GoRoute(
          path: AppRoutes.urlInput,
          builder: (context, state) => const UrlInputScreen(),
        ),
        GoRoute(
          path: AppRoutes.process,
          builder: (context, state) {
            final apiUrl = state.extra as String?;
            if (apiUrl == null || apiUrl.isEmpty) {
              return const Scaffold(body: Center(child: Text('Error: No URL provided')));
            }
            return ProcessScreen(apiUrl: apiUrl);
          },
        ),
      ],
    );
  }
}
