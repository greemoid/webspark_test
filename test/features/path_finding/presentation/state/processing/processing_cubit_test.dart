import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:webspark_test/core/failure/failure.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/calculate_paths_use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/get_path_tasks_use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/send_results_use_case.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_state.dart';

class MockGetPathTasksUseCase extends Mock implements GetPathTasksUseCase {}

class MockCalculatePathsUseCase extends Mock implements CalculatePathsUseCase {}

class MockSendResultsUseCase extends Mock implements SendResultsUseCase {}

class FakeCalculatePathsParams extends Fake implements CalculatePathsParams {}

class FakeSendResultsParams extends Fake implements SendResultsParams {}

void main() {
  late ProcessingCubit cubit;
  late MockGetPathTasksUseCase mockGetPathTasksUseCase;
  late MockCalculatePathsUseCase mockCalculatePathsUseCase;
  late MockSendResultsUseCase mockSendResultsUseCase;

  setUpAll(() {
    registerFallbackValue(FakeCalculatePathsParams());
    registerFallbackValue(FakeSendResultsParams());
  });

  setUp(() {
    mockGetPathTasksUseCase = MockGetPathTasksUseCase();
    mockCalculatePathsUseCase = MockCalculatePathsUseCase();
    mockSendResultsUseCase = MockSendResultsUseCase();
    cubit = ProcessingCubit(
      mockGetPathTasksUseCase,
      mockCalculatePathsUseCase,
      mockSendResultsUseCase,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('ProcessingCubit', () {
    const tUrl = 'https://flutter.webspark.dev/flutter/api';
    const tTasks = [
      PathTask(
        id: '1',
        field: ['.X.', '.X.', '...'],
        start: GridPoint(x: 2, y: 1),
        end: GridPoint(x: 0, y: 2),
      ),
    ];
    const tResults = [
      PathResult(id: '1', steps: [], path: '', field: ['.X.', '.X.', '...']),
    ];

    test('initial state should be ProcessingState.initial', () {
      expect(cubit.state, const ProcessingState.initial());
    });

    blocTest<ProcessingCubit, ProcessingState>(
      'emits [loadingTasks, calculating, ready] when startProcessing is successful',
      build: () {
        when(() => mockGetPathTasksUseCase(tUrl))
            .thenAnswer((_) async => const Right(tTasks));
        when(() => mockCalculatePathsUseCase(any()))
            .thenAnswer((_) async => const Right(tResults));
        return cubit;
      },
      act: (cubit) => cubit.startProcessing(tUrl),
      expect: () => const [
        ProcessingState.loadingTasks(),
        ProcessingState.calculating(completed: 0, total: 1),
        ProcessingState.ready(results: tResults),
      ],
    );

    blocTest<ProcessingCubit, ProcessingState>(
      'emits [loadingTasks, failure] when getTasks fails',
      build: () {
        when(() => mockGetPathTasksUseCase(tUrl))
            .thenAnswer((_) async => const Left(ServerFailure()));
        return cubit;
      },
      act: (cubit) => cubit.startProcessing(tUrl),
      expect: () => const [
        ProcessingState.loadingTasks(),
        ProcessingState.failure(
          message: 'A server error occurred. Please try again later.',
        ),
      ],
    );

    blocTest<ProcessingCubit, ProcessingState>(
      'emits [loadingTasks, failure] when getTasks returns empty list',
      build: () {
        when(() => mockGetPathTasksUseCase(tUrl))
            .thenAnswer((_) async => const Right([]));
        return cubit;
      },
      act: (cubit) => cubit.startProcessing(tUrl),
      expect: () => const [
        ProcessingState.loadingTasks(),
        ProcessingState.failure(message: 'No tasks received.'),
      ],
    );

    blocTest<ProcessingCubit, ProcessingState>(
      'emits [submitting, success] when submitResults is successful and returns true',
      build: () {
        when(() => mockSendResultsUseCase(any()))
            .thenAnswer((_) async => const Right(true));
        return cubit;
      },
      act: (cubit) => cubit.submitResults(tUrl, tResults),
      expect: () => const [
        ProcessingState.submitting(results: tResults),
        ProcessingState.success(results: tResults),
      ],
    );

    blocTest<ProcessingCubit, ProcessingState>(
      'emits [submitting, ready(with error)] when submitResults fails',
      build: () {
        when(() => mockSendResultsUseCase(any()))
            .thenAnswer((_) async => const Left(ServerFailure()));
        return cubit;
      },
      act: (cubit) => cubit.submitResults(tUrl, tResults),
      expect: () => const [
        ProcessingState.submitting(results: tResults),
        ProcessingState.ready(
          results: tResults,
          submissionError: 'A server error occurred. Please try again later.',
        ),
      ],
    );

    blocTest<ProcessingCubit, ProcessingState>(
      'emits [submitting, ready(with error)] when submitResults is successful but returns false',
      build: () {
        when(() => mockSendResultsUseCase(any()))
            .thenAnswer((_) async => const Right(false));
        return cubit;
      },
      act: (cubit) => cubit.submitResults(tUrl, tResults),
      expect: () => const [
        ProcessingState.submitting(results: tResults),
        ProcessingState.ready(
          results: tResults,
          submissionError: 'Server rejected the results.',
        ),
      ],
    );
  });
}
