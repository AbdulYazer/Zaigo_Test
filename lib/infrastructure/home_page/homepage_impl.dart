import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_test/domain/core/api_end_points.dart';
import 'package:zaigo_test/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:zaigo_test/domain/home_page/homepage_services.dart';
import 'package:zaigo_test/domain/home_page/model/lawyer_model.dart';

@LazySingleton(as: HomePageServices)
class HomePageImpl implements HomePageServices {
  @override
  Future<Either<MainFailure, List<LawyerModel>>> fetchLawyerDetails() async {
    try {
      final List<LawyerModel> lawyers = [];
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? '';
      final response = await Dio(BaseOptions()).get(
          ApiEndPoints.lawyerDetailsUrl,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List datas = response.data['data'];
              for (var element in datas) {
                lawyers.add(LawyerModel.fromJson(element));
              }
              print(lawyers);
        return Right(lawyers);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
