import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/src/request.dart';
import '../../custom_handler.dart';
import '../../routers/routers.dart';

class TokenHandler extends CustomHandler {
  @override
  Future<Response> delete(Request req) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response> get(Request req) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Response> post(Request req) async {
    Map<String, dynamic> body = jsonDecode(await req.readAsString());
    String token = body['token'];
    try {
      // Verify a token
      final jwt = JWT.verify(token, SecretKey('kieuPhong'));
      return Response.ok('token chưa hết hạn và payload: ${jwt.payload}');
    } catch (e) {
      return Response.ok('exception type: ${e.runtimeType}');
    }
  }

  @override
  Future<Response> put(Request req) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  void registerToRouter() {
    RouterCenter.router.post(RouterName.refreshToken, post);
  }
}
