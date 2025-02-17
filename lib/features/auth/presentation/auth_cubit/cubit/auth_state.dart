final class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class TermsAccepted extends AuthState {}

final class SignInError extends AuthState {
  final String errorMessage;

  SignInError(this.errorMessage);
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpError extends AuthState {
  final String errorMessage;

  SignUpError(this.errorMessage);
}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordError extends AuthState {
  final String errorMessage;
  ResetPasswordError(this.errorMessage);
}
