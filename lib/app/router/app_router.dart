import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:webspark_test/app/router/app_routes.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/url_input_screen.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/process_screen.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/preview_screen.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/result_list_screen.dart';

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
        GoRoute(
          path: AppRoutes.resultList,
          builder: (context, state) {
            final results = state.extra as List<PathResult>? ?? [];
            return ResultListScreen(results: results);
          },
        ),
        GoRoute(
          path: AppRoutes.preview,
          builder: (context, state) {
            final result = state.extra as PathResult?;
            if (result == null) {
              return const Scaffold(body: Center(child: Text('Error: No result provided')));
            }
            return PreviewScreen(result: result);
          },
        ),
      ],
    );
  }
}
