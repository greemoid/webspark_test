import 'package:webspark_test/features/path_finding/data/models/path_result_payload_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_result_request_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_task_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/result_grid_point_dto.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';

extension PathTaskDtoX on PathTaskDto {
  PathTask toDomain() {
    return PathTask(
      id: id,
      field: field,
      start: GridPoint(x: start.x, y: start.y),
      end: GridPoint(x: end.x, y: end.y),
    );
  }
}

extension PathResultX on PathResult {
  PathResultRequestDto toDto() {
    return PathResultRequestDto(
      id: id,
      result: PathResultPayloadDto(
        path: path,
        steps: steps
            .map(
              (s) => ResultGridPointDto(x: s.x.toString(), y: s.y.toString()),
            )
            .toList(),
      ),
    );
  }
}
