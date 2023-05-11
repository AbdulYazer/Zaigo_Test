part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isError,
    required bool isLoading,
    required bool isSuccess
  }) = Initial;

  factory LoginState.initial(){
    return const LoginState(isError: false, isLoading: false, isSuccess: false);
  }
  
}
