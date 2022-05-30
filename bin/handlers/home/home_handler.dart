import 'package:shelf/src/request.dart';

import 'package:shelf/src/response.dart';

import '../../custom_handler.dart';
import '../../routers/router_center.dart';
import '../../routers/router_name.dart';

class HomeHandler extends CustomHandler {
  @override
  delete(Request req) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response> get(Request req) async {
    return Response.ok('Hello, World KieuPhong!\n');
  }

  @override
  post(Request req) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  put(Request req) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<Response>? all(Request req) async {
    return Response.ok('Hello, World KieuPhong!\n');
  }

  @override
  void registerToRouter() {
    RouterCenter.router.all(RouterName.home, all);
  }
}
