import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/use_cases/use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/get_saved_api_url_use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/save_api_url_use_case.dart';
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_state.dart';
import 'package:webspark_test/features/path_finding/presentation/validators/api_url_validator.dart';

@injectable
class UrlInputCubit extends Cubit<UrlInputState> {
  UrlInputCubit(
    this._getSavedApiUrlUseCase,
    this._saveApiUrlUseCase,
    this._validator,
  ) : super(const UrlInputState.initial()) {
    _init();
  }

  final GetSavedApiUrlUseCase _getSavedApiUrlUseCase;
  final SaveApiUrlUseCase _saveApiUrlUseCase;
  final ApiUrlValidator _validator;

  Future<void> _init() async {
    final result = await _getSavedApiUrlUseCase(const NoParams());
    result.fold(
      (failure) => null,
      (url) {
        if (url != null && url.isNotEmpty) {
          emit(UrlInputState.initial(url: url));
        }
      },
    );
  }

  void onUrlChanged(String url) {
    emit(UrlInputState.initial(url: url));
  }

  Future<void> submit() async {
    final isLoading = state.maybeMap(loading: (_) => true, orElse: () => false);
    if (isLoading) return;
    
    final currentUrl = state.url;
    final validationResult = _validator.validate(currentUrl);
    
    await validationResult.fold(
      (failure) async {
        emit(UrlInputState.error(url: currentUrl, message: failure.message));
      },
      (validUrl) async {
        emit(UrlInputState.loading(url: validUrl));
        final saveResult = await _saveApiUrlUseCase(validUrl);
        saveResult.fold(
          (failure) {
            emit(UrlInputState.error(url: validUrl, message: failure.message));
          },
          (_) {
            emit(UrlInputState.success(url: validUrl));
          },
        );
      },
    );
  }
}
