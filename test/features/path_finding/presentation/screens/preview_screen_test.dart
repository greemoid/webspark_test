import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/preview_screen.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(home: widget);
  }

  group('PreviewScreen', () {
    testWidgets('renders grid and path text', (tester) async {
      const result = PathResult(
        id: '1',
        steps: [
          GridPoint(x: 0, y: 0),
          GridPoint(x: 1, y: 1),
          GridPoint(x: 2, y: 1),
        ],
        path: '(0,0)->(1,1)->(2,1)',
        field: ['.X.', '...', '...'],
      );

      await tester.pumpWidget(
        buildTestableWidget(const PreviewScreen(result: result)),
      );

      expect(find.text('Preview screen'), findsOneWidget);
      expect(find.text('(0,0)->(1,1)->(2,1)'), findsOneWidget);
      expect(find.byType(InteractiveViewer), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('renders invalid field data for empty field', (tester) async {
      const result = PathResult(id: '1', steps: [], path: '', field: []);

      await tester.pumpWidget(
        buildTestableWidget(const PreviewScreen(result: result)),
      );

      expect(find.text('Invalid field data'), findsOneWidget);
    });
  });
}
