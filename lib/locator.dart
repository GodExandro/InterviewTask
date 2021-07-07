import 'package:get_it/get_it.dart';
import 'package:test1/service/dialog_service.dart';
import 'package:test1/service/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
