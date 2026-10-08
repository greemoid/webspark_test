import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:webspark_test/app/router/app_routes.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/url_input_screen.dart';
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_state.dart';
import 'package:webspark_test/core/di/locator.dart';

class MockUrlInputCubit extends MockCubit<UrlInputState> implements UrlInputCubit {}

void main() {
  late MockUrlInputCubit mockUrlInputCubit;

  setUp(() {
    mockUrlInputCubit = MockUrlInputCubit();
    locator.registerFactory<UrlInputCubit>(() => mockUrlInputCubit);
  });

  tearDown(() {
    locator.reset();
  });

  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }

  group('UrlInputScreen', () {
    testWidgets('should render initial state correctly', (tester) async {
      when(() => mockUrlInputCubit.state).thenReturn(const UrlInputState.initial());

      await tester.pumpWidget(buildTestableWidget(const UrlInputScreen()));

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Start counting process'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should set text controller text if state has url on initial state', (tester) async {
      whenListen(
        mockUrlInputCubit,
        Stream.fromIterable([const UrlInputState.initial(url: 'https://saved.com/api')]),
        initialState: const UrlInputState.initial(),
      );

      await tester.pumpWidget(buildTestableWidget(const UrlInputScreen()));
      await tester.pumpAndSettle();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, 'https://saved.com/api');
    });

    testWidgets('should render error state correctly', (tester) async {
      when(() => mockUrlInputCubit.state)
          .thenReturn(const UrlInputState.error(url: 'invalid', message: 'Invalid URL format'));

      await tester.pumpWidget(buildTestableWidget(const UrlInputScreen()));

      expect(find.text('Invalid URL format'), findsOneWidget);
    });

    testWidgets('should render loading state correctly', (tester) async {
      when(() => mockUrlInputCubit.state).thenReturn(const UrlInputState.loading(url: 'valid'));

      await tester.pumpWidget(buildTestableWidget(const UrlInputScreen()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Start counting process'), findsNothing);
      
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);
    });

    testWidgets('should call onUrlChanged when text changes', (tester) async {
      when(() => mockUrlInputCubit.state).thenReturn(const UrlInputState.initial());

      await tester.pumpWidget(buildTestableWidget(const UrlInputScreen()));

      await tester.enterText(find.byType(TextField), 'new-url');
      verify(() => mockUrlInputCubit.onUrlChanged('new-url')).called(1);
    });

    testWidgets('should call submit when button is tapped', (tester) async {
      when(() => mockUrlInputCubit.state).thenReturn(const UrlInputState.initial());
      when(() => mockUrlInputCubit.submit()).thenAnswer((_) async {});

      await tester.pumpWidget(buildTestableWidget(const UrlInputScreen()));

      await tester.tap(find.byType(ElevatedButton));
      verify(() => mockUrlInputCubit.submit()).called(1);
    });
    
    testWidgets('should navigate to process screen on success state', (tester) async {
      whenListen(
        mockUrlInputCubit,
        Stream.fromIterable([const UrlInputState.success(url: 'https://example.com/api')]),
        initialState: const UrlInputState.initial(),
      );
      
      final router = GoRouter(
        initialLocation: AppRoutes.urlInput,
        routes: [
          GoRoute(
            path: AppRoutes.urlInput,
            builder: (context, state) => const UrlInputScreen(),
          ),
          GoRoute(
            path: AppRoutes.process,
            builder: (context, state) => const Scaffold(body: Text('Process Screen View')),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
        ),
      );
      await tester.pumpAndSettle();
      
      expect(find.text('Process Screen View'), findsOneWidget);
      expect(find.text('Start counting process'), findsNothing);
    });
  });
}
