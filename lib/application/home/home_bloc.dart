import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zaigo_test/domain/home_page/homepage_services.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/home_page/model/lawyer_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomePageServices _homePageServices;
  HomeBloc(this._homePageServices) : super(HomeState.initial()) {
    on<FetchLawyerDetails>((event, emit) async{
      emit(const HomeState(isError: false, isLoading: true, lawyerDetails: []));
    final _result = await _homePageServices.fetchLawyerDetails();
    final newState = _result.fold((MainFailure failure) {
      return const HomeState(isError: true, isLoading: false, lawyerDetails: []);
    }, (List<LawyerModel> resp) {
      return HomeState(isError: false, isLoading: false, lawyerDetails: resp);
    });
    emit(newState);
    });
  }
}
