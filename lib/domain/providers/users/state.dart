import 'package:equatable/equatable.dart';
import 'package:owwn_coding_challenge/core/models/user.dart';

class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object?> get props => [];
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersError extends UsersState {
  final String error;
  const UsersError(this.error);
}

class UsersLoaded extends UsersState {
  final Map<int, List<User>> apiResponsePerPage;

  const UsersLoaded(
    this.apiResponsePerPage,
  );

  UsersLoaded addPage(List<User> newUsers, int pageNumber) {
    apiResponsePerPage[pageNumber] = newUsers;

    return UsersLoaded(apiResponsePerPage);
  }

  @override
  List<Object?> get props => [
        apiResponsePerPage,
      ];
}
