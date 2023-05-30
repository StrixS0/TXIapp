import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/utils/screen.dart';

class Router {

  static Future<dynamic> navigateTo(Screen routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName.value, arguments: arguments);
  }

  static Future<dynamic> pushReplacementNamed(Screen routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName.value, arguments: arguments);
  }

  static void disableBackNavigation() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }


  static void goBack() {
    navigatorKey.currentState!.pop();
  }
}