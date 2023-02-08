import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/domain/providers/users/state.dart';
import 'package:owwn_coding_challenge/domain/repository/owwn_repository.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

class UsersNotifier extends StateNotifier<UsersState> {
  final OWWNRepository owwnRepo;

  UsersNotifier(
    this.owwnRepo,
  ) : super(const UsersLoading());

  Future<void> fetchUsers(
    int page,
    int limit,
    String accessToken,
  ) async {
    if (state is UsersLoaded &&
        (state as UsersLoaded).apiResponsePerPage.containsKey(page)) {
      logger.e('Already cached');

      return;
    }
    logger.e('Fetching from API');

    try {
      final response = await owwnRepo.getUsers(
        page,
        limit,
        accessToken,
      );

      logger.e(response.users);

      if (state is UsersLoaded) {
        // Incremental load
        // Add new page to State
        state = (state as UsersLoaded).addPage(response.users, page);
      } else {
        // First load
        state = UsersLoaded({
          page: response.users,
        });
      }
    } catch (err, s) {
      logger.e(s);
      state = UsersError(err.toString());
    }
  }
}
