import 'package:flutter_evaluation/src/model/serviceModel.dart';
import 'package:get_it/get_it.dart';
import './src/controllers/apiServices.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiServices('students'));
  locator.registerLazySingleton(() => ServiceModel()) ;
}