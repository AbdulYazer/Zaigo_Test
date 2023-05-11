part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login({required String phoneNumber,required String password}) = Login;

  const factory LoginEvent.retry() = Retry;
  
}