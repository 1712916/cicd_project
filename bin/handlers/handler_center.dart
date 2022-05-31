import 'handlers.dart';

class HandlerCenter {
  static void registerToRouter() {
    HomeHandler().registerToRouter();
    LoginHandler().registerToRouter();
    RegisterHandler().registerToRouter();
  }
}