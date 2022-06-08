import 'package:shelf/shelf.dart';

abstract class CustomHandler {
  Future<Response> get(Request req);
  Future<Response> post(Request req);
  Future<Response> put(Request req);
  Future<Response> delete(Request req);
  Future<Response>? all(Request req) {
    return null;
  }

  void registerToRouter();
}