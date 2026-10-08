import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/presentation/screens/process_screen.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_state.dart';
import 'package:webspark_test/features/path_finding/presentation/widgets/process_loading_view.dart';
import 'package:webspark_test/features/path_finding/presentation/widgets/process_error_view.dart';
import 'package:webspark_test/core/di/locator.dart';

class MockProcessingCubit extends MockCubit<ProcessingState>
    implements ProcessingCubit {}

void main() {
  late MockProcessingCubit mockProcessingCubit;

  setUp(() {
    mockProcessingCubit = MockProcessingCubit();
    // Use GetIt (locator) to inject the mock since ProcessScreen reads from it
    locator.registerFactory<ProcessingCubit>(() => mockProcessingCubit);
  });

  tearDown(() {
    locator.reset();
  });

  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(home: widget);
  }

  group('ProcessScreen', () {
    const tApiUrl = 'https://example.com/api';

    final tTasks = [
      const PathTask(
        id: '1',
        field: ['...', '...'],
        start: GridPoint(x: 0, y: 0),
        end: GridPoint(x: 1, y: 1),
      ),
    ];

    testWidgets('should call loadTasks on init', (tester) async {
      when(() => mockProcessingCubit.state)
          .thenReturn(const ProcessingState.initial());
      when(() => mockProcessingCubit.loadTasks(any())).thenAnswer((_) async {});

      await tester.pumpWidget(
        buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
      );

      verify(() => mockProcessingCubit.loadTasks(tApiUrl)).called(1);
    });

    testWidgets('should render ProcessLoadingView when state is loading', (
      tester,
    ) async {
      when(() => mockProcessingCubit.state)
          .thenReturn(const ProcessingState.loading());
      when(() => mockProcessingCubit.loadTasks(any())).thenAnswer((_) async {});

      await tester.pumpWidget(
        buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
      );
      await tester.pump();

      expect(find.byType(ProcessLoadingView), findsOneWidget);
    });

    testWidgets('should render ProcessErrorView when state is failure', (
      tester,
    ) async {
      when(() => mockProcessingCubit.state).thenReturn(
        const ProcessingState.failure(message: 'Server error occurred'),
      );
      when(() => mockProcessingCubit.loadTasks(any())).thenAnswer((_) async {});

      await tester.pumpWidget(
        buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
      );
      await tester.pump();

      expect(find.byType(ProcessErrorView), findsOneWidget);
      expect(find.text('Server error occurred'), findsOneWidget);
    });

    testWidgets('should render Received tasks text when state is loaded', (
      tester,
    ) async {
      when(() => mockProcessingCubit.state)
          .thenReturn(ProcessingState.loaded(tasks: tTasks));
      when(() => mockProcessingCubit.loadTasks(any())).thenAnswer((_) async {});

      await tester.pumpWidget(
        buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
      );
      await tester.pump();

      expect(find.text('Received 1 tasks!'), findsOneWidget);
    });

    testWidgets(
      'should render No tasks received text when state is loaded but empty',
      (tester) async {
        when(() => mockProcessingCubit.state)
            .thenReturn(const ProcessingState.loaded(tasks: []));
        when(() => mockProcessingCubit.loadTasks(any()))
            .thenAnswer((_) async {});

        await tester.pumpWidget(
          buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
        );
        await tester.pump();

        expect(find.text('No tasks received.'), findsOneWidget);
      },
    );
  });
}
