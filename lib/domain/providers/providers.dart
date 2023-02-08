import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/domain/providers/auth/notifier.dart';
import 'package:owwn_coding_challenge/domain/providers/auth/state.dart';
import 'package:owwn_coding_challenge/domain/providers/users/notifier.dart';
import 'package:owwn_coding_challenge/domain/providers/users/state.dart';
import 'package:owwn_coding_challenge/domain/repository/owwn_repository.dart';

final Provider<OWWNRepository> owwnRepoProvider =
    Provider<OWWNRepository>((ref) {
  return ImplOWWNRepository();
});

final pageProvider = StateProvider.autoDispose<int>(
  (ref) => 1,
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(owwnRepoProvider),
  ),
);

final usersNotifierProvider = StateNotifierProvider<UsersNotifier, UsersState>(
  (ref) => UsersNotifier(
    ref.watch(owwnRepoProvider),
  ),
);
