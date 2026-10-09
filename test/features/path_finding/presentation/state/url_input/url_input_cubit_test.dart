import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:webspark_test/core/failure/failure.dart';
import 'package:webspark_test/core/use_cases/use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/get_saved_api_url_use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/save_api_url_use_case.dart';
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_state.dart';
import 'package:webspark_test/features/path_finding/presentation/validators/api_url_validator.dart';

class MockGetSavedApiUrlUseCase extends Mock implements GetSavedApiUrlUseCase {}

class MockSaveApiUrlUseCase extends Mock implements SaveApiUrlUseCase {}

class MockApiUrlValidator extends Mock implements ApiUrlValidator {}

class TestFailure extends Failure {
  const TestFailure(String message) : super(message: message);
}

void main() {
  late MockGetSavedApiUrlUseCase mockGetSavedApiUrlUseCase;
  late MockSaveApiUrlUseCase mockSaveApiUrlUseCase;
  late MockApiUrlValidator mockApiUrlValidator;

  setUpAll(() {
    registerFallbackValue(const NoParams());
  });

  setUp(() {
    mockGetSavedApiUrlUseCase = MockGetSavedApiUrlUseCase();
    mockSaveApiUrlUseCase = MockSaveApiUrlUseCase();
    mockApiUrlValidator = MockApiUrlValidator();
  });

  UrlInputCubit buildCubit() {
    return UrlInputCubit(
      mockGetSavedApiUrlUseCase,
      mockSaveApiUrlUseCase,
      mockApiUrlValidator,
    );
  }

  group('UrlInputCubit init', () {
    test(
      'should emit initial state with empty url if getSavedApiUrl fails',
      () async {
        when(() => mockGetSavedApiUrlUseCase(any()))
            .thenAnswer((_) async => const Left(TestFailure('Error')));

        final cubit = buildCubit();

        expect(cubit.state, const UrlInputState.initial(url: ''));
        verify(() => mockGetSavedApiUrlUseCase(any())).called(1);
      },
    );

    test(
      'should emit initial state with url if getSavedApiUrl succeeds',
      () async {
        const savedUrl = 'https://example.com/api';
        when(() => mockGetSavedApiUrlUseCase(any()))
            .thenAnswer((_) async => const Right(savedUrl));

        final cubit = buildCubit();

        // We need to wait for the microtask to finish since _init is async
        await Future.delayed(Duration.zero);

        expect(cubit.state, const UrlInputState.initial(url: savedUrl));
      },
    );
  });

  group('UrlInputCubit actions', () {
    const validUrl = 'https://valid.com/api';
    const invalidUrl = 'invalid-url';

    blocTest<UrlInputCubit, UrlInputState>(
      'onUrlChanged should emit initial state with new url',
      build: () {
        when(() => mockGetSavedApiUrlUseCase(any()))
            .thenAnswer((_) async => const Right(null));
        return buildCubit();
      },
      act: (cubit) => cubit.onUrlChanged('new-url'),
      expect: () => [const UrlInputState.initial(url: 'new-url')],
    );

    blocTest<UrlInputCubit, UrlInputState>(
      'submit should emit error if validation fails',
      build: () {
        when(() => mockGetSavedApiUrlUseCase(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockApiUrlValidator.validate(any()))
            .thenReturn(const Left(TestFailure('Invalid URL')));
        return buildCubit();
      },
      seed: () => const UrlInputState.initial(url: invalidUrl),
      act: (cubit) => cubit.submit(),
      expect: () => [
        const UrlInputState.error(url: invalidUrl, message: 'Invalid URL'),
      ],
    );

    blocTest<UrlInputCubit, UrlInputState>(
      'submit should emit [loading, error] if save fails',
      build: () {
        when(() => mockGetSavedApiUrlUseCase(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockApiUrlValidator.validate(any()))
            .thenReturn(const Right(validUrl));
        when(() => mockSaveApiUrlUseCase(validUrl))
            .thenAnswer((_) async => const Left(TestFailure('Save Error')));
        return buildCubit();
      },
      seed: () => const UrlInputState.initial(url: validUrl),
      act: (cubit) => cubit.submit(),
      expect: () => [
        const UrlInputState.loading(url: validUrl),
        const UrlInputState.error(url: validUrl, message: 'Save Error'),
      ],
    );

    blocTest<UrlInputCubit, UrlInputState>(
      'submit should emit [loading, success] if save succeeds',
      build: () {
        when(() => mockGetSavedApiUrlUseCase(any()))
            .thenAnswer((_) async => const Right(null));
        when(() => mockApiUrlValidator.validate(any()))
            .thenReturn(const Right(validUrl));
        when(() => mockSaveApiUrlUseCase(validUrl))
            .thenAnswer((_) async => const Right(unit));
        return buildCubit();
      },
      seed: () => const UrlInputState.initial(url: validUrl),
      act: (cubit) => cubit.submit(),
      expect: () => [
        const UrlInputState.loading(url: validUrl),
        const UrlInputState.success(url: validUrl),
      ],
    );
  });
}
