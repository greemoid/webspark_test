import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/calculate_paths_use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/get_path_tasks_use_case.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/send_results_use_case.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_state.dart';

@injectable
class ProcessingCubit extends Cubit<ProcessingState> {
  ProcessingCubit(
    this._getPathTasksUseCase,
    this._calculatePathsUseCase,
    this._sendResultsUseCase,
  ) : super(const ProcessingState.initial());

  final GetPathTasksUseCase _getPathTasksUseCase;
  final CalculatePathsUseCase _calculatePathsUseCase;
  final SendResultsUseCase _sendResultsUseCase;

  Future<void> startProcessing(String url) async {
    final isLoading = state.maybeMap(
      loadingTasks: (_) => true,
      calculating: (_) => true,
      submitting: (_) => true,
      orElse: () => false,
    );
    if (isLoading) return;

    emit(const ProcessingState.loadingTasks());

    final getResult = await _getPathTasksUseCase(url);

    getResult.fold(
      (failure) => emit(ProcessingState.failure(message: failure.message)),
      (tasks) async {
        if (tasks.isEmpty) {
          emit(const ProcessingState.failure(message: 'No tasks received.'));
          return;
        }

        emit(ProcessingState.calculating(completed: 0, total: tasks.length));

        final calculateResult = await _calculatePathsUseCase(
          CalculatePathsParams(
            tasks: tasks,
            onProgress: (completed, total) {
              if (!isClosed) {
                emit(
                  ProcessingState.calculating(
                    completed: completed,
                    total: total,
                  ),
                );
              }
            },
          ),
        );

        if (isClosed) return;

        calculateResult.fold(
          (failure) => emit(ProcessingState.failure(message: failure.message)),
          (results) => emit(ProcessingState.ready(results: results)),
        );
      },
    );
  }

  Future<void> submitResults(String url, List<PathResult> results) async {
    final isSubmitting = state.maybeMap(
      submitting: (_) => true,
      orElse: () => false,
    );
    if (isSubmitting) return;

    emit(ProcessingState.submitting(results: results));

    final submitResult = await _sendResultsUseCase(
      SendResultsParams(url: url, results: results),
    );

    if (isClosed) return;

    submitResult.fold(
      (failure) => emit(
        ProcessingState.ready(
          results: results,
          submissionError: failure.message,
        ),
      ),
      (success) {
        if (success) {
          emit(ProcessingState.success(results: results));
        } else {
          emit(
            ProcessingState.ready(
              results: results,
              submissionError: 'Server rejected the results.',
            ),
          );
        }
      },
    );
  }
}
