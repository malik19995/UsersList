import 'package:dio/dio.dart';
import 'package:owwn_coding_challenge/core/constants/constants.dart';
import 'package:owwn_coding_challenge/core/models/api_response.dart';
import 'package:owwn_coding_challenge/core/models/user.dart';
import 'package:owwn_coding_challenge/domain/api/owwn_api.dart';

abstract class OWWNRepository {
  final owwnApi = OWWNClient(Dio());
  Future<ApiResponse> getUsers(int page, int limit, String accessToken);
  Future<Map<String, String>> refreshToken(String refToken);
  Future<Map<String, String>> authenticateUser(String email);
}

class ImplOWWNRepository extends OWWNRepository {
  @override
  Future<Map<String, String>> authenticateUser(String email) {
    return owwnApi.authenticate(
      apiKey,
      {"email": email},
    );
  }

  @override
  Future<Map<String, String>> refreshToken(String refToken) {
    return owwnApi.refreshToken(
      apiKey,
      {
        'refresh_token': refToken,
      },
    );
  }

  ///
  ///
  /// Fetch Users Endpoint
  @override
  Future<ApiResponse> getUsers(int page, int limit, String accessToken) async {
    return owwnApi
        .getUsers(limit, page, accessToken, apiKey)
        .catchError((err, s) {
      throw '${(err as DioError).response!.statusCode}';
    });
  }
}

class MockOWWNRepository extends OWWNRepository {
  @override
  Future<Map<String, String>> authenticateUser(String email) {
    // TODO: implement authenticateUser
    return Future.value({
      'access_token': 'test_auth_token',
      'refresh_token': 'test_refresh_token',
    });
  }

  List<User> _getTestUsers({
    int count = 10,
  }) {
    return List.generate(
      count,
      (id) => User(
        kEmail,
        [],
        status: id < 5 ? 'active' : 'inactive',
        id: '$id',
        name: 'Test User $id',
        created_at: DateTime.now(),
        gender: id < 5 ? 'male' : 'female',
        partner_id: '${id + 2}',
      ),
    );
  }

  @override
  Future<ApiResponse> getUsers(int page, int limit, String token) {
    // TODO: implement getUsers
    return Future.value(
      ApiResponse(
        page == 1 ? _getTestUsers() : [],
        10,
      ),
    );
  }

  @override
  Future<Map<String, String>> refreshToken(String refToken) {
    return Future.value({
      'access_token': 'test_auth_token',
      'refresh_token': 'test_refresh_token',
    });
  }
}
