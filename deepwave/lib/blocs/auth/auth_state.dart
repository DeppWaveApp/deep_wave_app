part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? user;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.user,
  });

  const AuthState.unknown() : this();

  const AuthState.authenticated({required auth.User user})
      : this(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated() : this(status: AuthStatus.unauthenticated);

  @override
  List<Object> get props => [status, user as Object];
}
