import 'package:bloc/bloc.dart';

import '../views/home_view.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomeView();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        // yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        // yield MyOrdersPage();
        break;
    }
  }
}
