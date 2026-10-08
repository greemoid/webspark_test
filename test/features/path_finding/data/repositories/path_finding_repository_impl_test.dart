import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';
import 'package:webspark_test/core/di/locator.dart';
import 'package:webspark_test/features/path_finding/data/api/path_finding_api.dart';
import 'package:webspark_test/features/path_finding/data/models/base_response_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_result_payload_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_result_request_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_task_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_verification_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/task_grid_point_dto.dart';
import 'package:webspark_test/features/path_finding/data/repositories/path_finding_repository_impl.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';

class MockPathFindingApi extends Mock implements PathFindingApi {}

void main() {
  late PathFindingRepositoryImpl repository;
  late MockPathFindingApi mockApi;

  setUp(() {
    mockApi = MockPathFindingApi();
    locator.registerFactoryParam<PathFindingApi, String, dynamic>(
      (url, _) => mockApi,
    );

    repository = PathFindingRepositoryImpl();
  });

  tearDown(() {
    locator.reset();
  });

  const testUrl = 'https://example.com/api';

  group('getTasks', () {
    test(
      'returns List<PathTask> on successful response (error: false)',
      () async {
        final responseDto = BaseResponseDto<PathTaskDto>(
          error: false,
          message: 'Success',
          data: [
            const PathTaskDto(
              id: 'task-1',
              field: ['START', 'END'],
              start: TaskGridPointDto(x: 0, y: 0),
              end: TaskGridPointDto(x: 0, y: 1),
            ),
          ],
        );

        when(() => mockApi.getTasks()).thenAnswer((_) async => responseDto);

        final result = await repository.getTasks(testUrl);

        expect(result.isRight(), true);
        result.fold((l) => fail('Should be right'), (tasks) {
          expect(tasks, hasLength(1));
          expect(tasks.first.id, 'task-1');
          expect(tasks.first.field.length, 2);
          expect(tasks.first.start.x, 0);
          expect(tasks.first.end.y, 1);
        });
        verify(() => mockApi.getTasks()).called(1);
      },
    );

    test('returns ServerFailure when response has error: true', () async {
      final responseDto = BaseResponseDto<PathTaskDto>(
        error: true,
        message: 'Something went wrong',
        data: [],
      );

      when(() => mockApi.getTasks()).thenAnswer((_) async => responseDto);

      final result = await repository.getTasks(testUrl);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (r) => fail('Should be left'),
      );
    });

    test('returns ServerFailure on DioException', () async {
      when(() => mockApi.getTasks())
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      final result = await repository.getTasks(testUrl);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<UnknownFailure>()),
        (r) => fail('Should be left'),
      );
    });
  });

  group('submitResults', () {
    final domainResults = <PathResult>[
      const PathResult(
        id: 'task-1',
        steps: [GridPoint(x: 0, y: 0), GridPoint(x: 0, y: 1)],
        path: '0,0->0,1',
        field: ['.', '.'],
      ),
    ];

    setUpAll(() {
      registerFallbackValue(
        const PathResultRequestDto(
          id: 'dummy',
          result: PathResultPayloadDto(steps: [], path: ''),
        ),
      );
    });

    test('returns true on successful submission (error: false)', () async {
      final responseDto = BaseResponseDto<PathVerificationDto>(
        error: false,
        message: 'Success',
        data: [const PathVerificationDto(id: 'task-1', correct: true)],
      );

      when(() => mockApi.submitResults(any()))
          .thenAnswer((_) async => responseDto);

      final result = await repository.submitResults(testUrl, domainResults);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should be right'),
        (success) => expect(success, true),
      );

      final captured = verify(() => mockApi.submitResults(captureAny()))
          .captured;
      final requestList = captured.first as List<PathResultRequestDto>;
      expect(requestList, hasLength(1));
      expect(requestList.first.id, 'task-1');
      expect(requestList.first.result.path, '0,0->0,1');
    });

    test('returns ServerFailure when response has error: true', () async {
      final responseDto = BaseResponseDto<PathVerificationDto>(
        error: true,
        message: 'Invalid results',
        data: [],
      );

      when(() => mockApi.submitResults(any()))
          .thenAnswer((_) async => responseDto);

      final result = await repository.submitResults(testUrl, domainResults);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (r) => fail('Should be left'),
      );
    });
  });
}
