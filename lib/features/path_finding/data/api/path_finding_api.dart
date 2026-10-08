import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:webspark_test/features/path_finding/data/models/base_response_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_result_request_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_task_dto.dart';
import 'package:webspark_test/features/path_finding/data/models/path_verification_dto.dart';

part 'path_finding_api.g.dart';

@RestApi()
@injectable
abstract class PathFindingApi {
  @factoryMethod
  factory PathFindingApi(Dio dio, {@factoryParam String? baseUrl}) =
      _PathFindingApi;

  @GET('')
  Future<BaseResponseDto<PathTaskDto>> getTasks();

  @POST('')
  Future<BaseResponseDto<PathVerificationDto>> submitResults(
    @Body() List<PathResultRequestDto> results,
  );
}
