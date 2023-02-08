import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/domain/providers/auth/state.dart';
import 'package:owwn_coding_challenge/domain/repository/owwn_repository.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final OWWNRepository owwnRepo;
  AuthNotifier(this.owwnRepo) : super(const AuthInitial());

  Future<void> authenticateUser(String email) async {
    state = const AuthLoading();
    final authTokens = await owwnRepo.authenticateUser(email);

    logger.e(authTokens);
    state = AuthLoaded(
      authTokens['access_token']!,
      authTokens['refresh_token']!,
      email,
    );
    logger.e(authTokens);
  }

  Future<void> logout() async {
    state = const AuthInitial();
  }

  Future<void> refreshToken() async {
    final authTokens = await owwnRepo
        .refreshToken((state as AuthLoaded).refreshToken)
        .catchError((err) {
      logger.e(err);
    });

    logger.e(authTokens);
    state = AuthLoaded(
      authTokens['access_token']!,
      authTokens['refresh_token']!,
      (state as AuthLoaded).email,
    );
  }
}
