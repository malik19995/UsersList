import 'package:equatable/equatable.dart';

///
///
/// Auth State
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthLoaded extends AuthState {
  final String authToken;
  final String refreshToken;
  final String email;

  const AuthLoaded(this.authToken, this.refreshToken, this.email);

  @override
  List<Object?> get props => [authToken, refreshToken, email];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthExpired extends AuthState {
  const AuthExpired();
}
