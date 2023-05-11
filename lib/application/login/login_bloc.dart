import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_test/domain/core/api_end_points.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<Login>((event, emit, {BuildContext? context}) async {
      emit(const LoginState(isError: false, isLoading: true, isSuccess: false));
      try {
        await Dio(BaseOptions()).post(
          ApiEndPoints.loginUrl,
          queryParameters: {
            'phone_no': event.phoneNumber,
            'password': event.password,
          },
        ).then((value) async {
          if (value.data.containsKey('error') == true) {
            emit(const LoginState(
                isError: true, isLoading: false, isSuccess: false));
          } else {
            final prefs = await SharedPreferences.getInstance();
            prefs.setString('token', value.data['access_token']);
            emit(const LoginState(
                isLoading: false, isError: false, isSuccess: true));
          }
        });
      } catch (e) {
        emit(const LoginState(
            isError: true, isLoading: false, isSuccess: false));
      }
    });
    on<Retry>((event, emit) {
      emit(LoginState(isError: false, isLoading: false, isSuccess: false));
    });
  }
}
