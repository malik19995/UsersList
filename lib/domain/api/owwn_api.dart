import 'package:dio/dio.dart';
import 'package:owwn_coding_challenge/core/constants/constants.dart';
import 'package:owwn_coding_challenge/core/models/api_response.dart';
import 'package:retrofit/retrofit.dart';

part 'owwn_api.g.dart';

///
///
/// Retrofit API Generator used for Endpoint configuration
@RestApi(baseUrl: baseUrl)
abstract class OWWNClient {
  factory OWWNClient(Dio dio, {String baseUrl}) = _OWWNClient;

  @GET("/users")
  Future<ApiResponse> getUsers(
    @Query("limit") int limit,
    @Query("page") int page,
    @Header('Authorization') String apiToken,
    @Header("X-API-KEY") String apiKey,
  );

  @POST("/auth")
  Future<Map<String, String>> authenticate(
    @Header("X-API-KEY") String apiKey,
    @Body() Map<String, dynamic> emailMap,
  );

  @POST("/refresh")
  Future<Map<String, String>> refreshToken(
    @Header("X-API-KEY") String apiKey,
    @Body() Map<String, dynamic> refreshMap,
  );
}
