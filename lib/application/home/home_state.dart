part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isError,
    required bool isLoading,
    required List<LawyerModel> lawyerDetails,
  }) = Initial;

  factory HomeState.initial(){
    return const HomeState(isError: false, isLoading: false, lawyerDetails: []);
  }

}
