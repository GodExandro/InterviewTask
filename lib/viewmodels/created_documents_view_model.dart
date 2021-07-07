
import 'package:test1/constants/route_names.dart';
import 'package:test1/service/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class CreatedDocumentsViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.navigateTo(HomeViewRoute);
  }
}
