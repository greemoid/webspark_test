import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';

part 'processing_state.freezed.dart';

@freezed
class ProcessingState with _$ProcessingState {
  const factory ProcessingState.initial() = _Initial;
  const factory ProcessingState.loading() = _Loading;
  const factory ProcessingState.loaded({required List<PathTask> tasks}) = _Loaded;
  const factory ProcessingState.failure({required String message}) = _Failure;
}
