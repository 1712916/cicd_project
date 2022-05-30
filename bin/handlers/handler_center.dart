import 'handlers.dart';

class HandlerCenter {
  static void registerToRouter() {
    HomeHandler().registerToRouter();
    AuthenHandler().registerToRouter();
  }
}