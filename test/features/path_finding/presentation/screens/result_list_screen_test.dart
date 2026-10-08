import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/result_list_screen.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(home: widget);
  }

  group('ResultListScreen', () {
    testWidgets('renders list of results', (tester) async {
      const results = [
        PathResult(
          id: '1',
          steps: [GridPoint(x: 0, y: 0), GridPoint(x: 1, y: 1)],
          path: '(0,0)->(1,1)',
          field: ['..', '..'],
        ),
        PathResult(
          id: '2',
          steps: [GridPoint(x: 1, y: 0), GridPoint(x: 2, y: 1)],
          path: '(1,0)->(2,1)',
          field: ['...', '...'],
        ),
      ];

      await tester.pumpWidget(
        buildTestableWidget(const ResultListScreen(results: results)),
      );

      expect(find.text('Result list screen'), findsOneWidget);
      expect(find.text('(0,0)->(1,1)'), findsOneWidget);
      expect(find.text('(1,0)->(2,1)'), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(2));
    });
  });
}
