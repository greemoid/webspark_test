import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';

part 'processing_state.freezed.dart';

@freezed
class ProcessingState with _$ProcessingState {
  const factory ProcessingState.initial() = _Initial;
  const factory ProcessingState.loadingTasks() = _LoadingTasks;
  const factory ProcessingState.calculating({
    required int completed,
    required int total,
  }) = _Calculating;
  const factory ProcessingState.ready({
    required List<PathResult> results,
    String? submissionError,
  }) = _Ready;
  const factory ProcessingState.submitting({
    required List<PathResult> results,
  }) = _Submitting;
  const factory ProcessingState.success({
    required List<PathResult> results,
  }) = _Success;
  const factory ProcessingState.failure({required String message}) = _Failure;
}
