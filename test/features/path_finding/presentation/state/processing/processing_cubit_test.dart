import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/get_path_tasks_use_case.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_state.dart';

class MockGetPathTasksUseCase extends Mock implements GetPathTasksUseCase {}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message: message);
}

void main() {
  late ProcessingCubit cubit;
  late MockGetPathTasksUseCase mockGetPathTasksUseCase;

  setUp(() {
    mockGetPathTasksUseCase = MockGetPathTasksUseCase();
    cubit = ProcessingCubit(mockGetPathTasksUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  group('ProcessingCubit', () {
    const tUrl = 'https://example.com/api';

    final tTasks = [
      const PathTask(
        id: '1',
        field: ['...', '...'],
        start: GridPoint(x: 0, y: 0),
        end: GridPoint(x: 1, y: 1),
      ),
    ];

    test('initial state should be ProcessingState.initial()', () {
      expect(cubit.state, const ProcessingState.initial());
    });

    blocTest<ProcessingCubit, ProcessingState>(
      'should emit [loading, loaded] when loadTasks is successful',
      build: () {
        when(() => mockGetPathTasksUseCase(any()))
            .thenAnswer((_) async => Right(tTasks));
        return cubit;
      },
      act: (cubit) => cubit.loadTasks(tUrl),
      expect: () => [
        const ProcessingState.loading(),
        ProcessingState.loaded(tasks: tTasks),
      ],
      verify: (_) {
        verify(() => mockGetPathTasksUseCase(tUrl)).called(1);
      },
    );

    blocTest<ProcessingCubit, ProcessingState>(
      'should emit [loading, failure] when loadTasks fails',
      build: () {
        when(() => mockGetPathTasksUseCase(any()))
            .thenAnswer((_) async => const Left(ServerFailure('Server Error')));
        return cubit;
      },
      act: (cubit) => cubit.loadTasks(tUrl),
      expect: () => [
        const ProcessingState.loading(),
        const ProcessingState.failure(message: 'Server Error'),
      ],
      verify: (_) {
        verify(() => mockGetPathTasksUseCase(tUrl)).called(1);
      },
    );
  });
}
