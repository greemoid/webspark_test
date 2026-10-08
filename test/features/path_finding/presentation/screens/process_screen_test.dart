import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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

    testWidgets('should call startProcessing on init', (tester) async {
      when(() => mockProcessingCubit.state)
          .thenReturn(const ProcessingState.initial());
      when(() => mockProcessingCubit.startProcessing(any()))
          .thenAnswer((_) async {});

      await tester.pumpWidget(
        buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
      );

      verify(() => mockProcessingCubit.startProcessing(tApiUrl)).called(1);
    });

    testWidgets('should render ProcessLoadingView when state is loadingTasks', (
      tester,
    ) async {
      when(() => mockProcessingCubit.state)
          .thenReturn(const ProcessingState.loadingTasks());
      when(() => mockProcessingCubit.startProcessing(any()))
          .thenAnswer((_) async {});

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
      when(() => mockProcessingCubit.startProcessing(any()))
          .thenAnswer((_) async {});

      await tester.pumpWidget(
        buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
      );
      await tester.pump();

      expect(find.byType(ProcessErrorView), findsOneWidget);
      expect(find.text('Server error occurred'), findsOneWidget);
    });

    testWidgets(
      'should render All calculations has finished when state is ready',
      (tester) async {
        when(() => mockProcessingCubit.state)
            .thenReturn(const ProcessingState.ready(results: []));
        when(() => mockProcessingCubit.startProcessing(any()))
            .thenAnswer((_) async {});

        await tester.pumpWidget(
          buildTestableWidget(const ProcessScreen(apiUrl: tApiUrl)),
        );
        await tester.pump();

        expect(
          find.text(
            'All calculations has finished, you can send your results to server',
          ),
          findsOneWidget,
        );
      },
    );
  });
}
