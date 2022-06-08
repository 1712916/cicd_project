import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../custom_handler.dart';
import '../../repositories/repositories.dart';
import '../../routers/routers.dart';
import '../../services/services.dart';

class RegisterHandler extends CustomHandler {
  final IRegisterService _registerService = RegisterService(AuthenRepository());

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
    return _registerService.onRegister(account: body['account'], password: body['password']);
  }

  @override
  Future<Response> put(Request req) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  void registerToRouter() {
    RouterCenter.router.post(RouterName.register, post);
  }
}
