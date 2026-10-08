import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/get_path_tasks_use_case.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_state.dart';

@injectable
class ProcessingCubit extends Cubit<ProcessingState> {
  ProcessingCubit(this._getPathTasksUseCase)
    : super(const ProcessingState.initial());

  final GetPathTasksUseCase _getPathTasksUseCase;

  Future<void> loadTasks(String url) async {
    final isLoading = state.maybeMap(loading: (_) => true, orElse: () => false);
    if (isLoading) return;

    emit(const ProcessingState.loading());
    final result = await _getPathTasksUseCase(url);

    result.fold(
      (failure) => emit(ProcessingState.failure(message: failure.message)),
      (tasks) => emit(ProcessingState.loaded(tasks: tasks)),
    );
  }
}
