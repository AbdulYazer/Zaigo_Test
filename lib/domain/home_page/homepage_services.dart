import 'package:dartz/dartz.dart';
import 'package:zaigo_test/domain/home_page/model/lawyer_model.dart';

import '../core/failures/main_failure.dart';

abstract class HomePageServices {
  Future<Either<MainFailure, List<LawyerModel>>> fetchLawyerDetails();
}