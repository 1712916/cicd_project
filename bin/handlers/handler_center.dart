import 'handlers.dart';
import 'profile/profile.dart';

class HandlerCenter {
  static void registerToRouter() {
    HomeHandler().registerToRouter();
    LoginHandler().registerToRouter();
    RegisterHandler().registerToRouter();
    UserProfileHandler().registerToRouter();
    TokenHandler().registerToRouter();
  }
}