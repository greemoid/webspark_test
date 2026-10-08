import 'package:flutter_test/flutter_test.dart';
import 'package:webspark_test/app/app.dart';
import 'package:webspark_test/app/router/app_router.dart';

void main() {
  testWidgets('Displays the initial screen', (tester) async {
    final router = AppRouter.create();
    addTearDown(router.dispose);

    await tester.pumpWidget(App(router: router));
    await tester.pumpAndSettle();

    expect(find.text('Webspark Test'), findsOneWidget);
  });
}
