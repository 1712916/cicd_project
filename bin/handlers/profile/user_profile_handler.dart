import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/src/request.dart';

import 'package:shelf/src/response.dart';

import '../../custom_handler.dart';
import '../../custom_response.dart';
import '../../middlewares/authen_middlerware.dart';
import '../../repositories/repositories.dart';
import '../../routers/routers.dart';
import '../../server.dart';
import '../../services/profile_service/profile_service.dart';

class UserProfileHandler extends CustomHandler {
  final IProfileService _profileService = ProfileService(ProfileRepository());

  @override
  Future<Response> delete(Request req) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response> get(Request req) async {
    String id = req.url.pathSegments[1];
    String token = AuthenMiddleware.getTokenFromRequest(req);
    String userId = JWT.verify(token, SecretKey(secretKey)).payload['id'];
    if (id == userId) {
      return _profileService.getProfile(userId: id);
    }
    return CustomResponse(statusCode: 404, message: 'Không thể tìm thấy thông tin này');
  }

  @override
  Future<Response> getProfile(Request req, String id) {
    return _profileService.getProfile(userId: id);
  }

  @override
  Future<Response> post(Request req) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Response> put(Request req) {
    // TODO: implement put
    throw UnimplementedError();
  }

  Future<Response> updateProfile(Request req, String userId) async {
    print('Log update url: ${req.url}');
    Map<String, dynamic> body = jsonDecode(await req.readAsString());
    return _profileService.updateProfileInfo(userId: userId, userName: body['userName'], dateOfBirth: body['dateOfBirth']);
  }

  Future<Response> addAddress(Request req) async {
    String id = req.url.pathSegments[1];
    String token = AuthenMiddleware.getTokenFromRequest(req);
    String userId = JWT.verify(token, SecretKey(secretKey)).payload['id'];
    if (id == userId) {
      Map<String, dynamic> body = jsonDecode(await req.readAsString());
      return _profileService.addAddress(userId: id, address: body['address']);
    }
    return CustomResponse(statusCode: 404, message: 'Không thể tìm thấy thông tin này');
  }

  Future<Response> deleteAddress(Request req) async {
    String id = req.url.pathSegments[1];
    String token = AuthenMiddleware.getTokenFromRequest(req);
    String userId = JWT.verify(token, SecretKey(secretKey)).payload['id'];
    if (id == userId) {
      Map<String, dynamic> body = jsonDecode(await req.readAsString());
      return _profileService.deleteAddress(userId: id, address: body['address']);
    }
    return CustomResponse(statusCode: 404, message: 'Không thể tìm thấy thông tin này');
  }

  @override
  void registerToRouter() {
    RouterCenter.router.get(RouterName.userProfile, Pipeline().addMiddleware(AuthenMiddleware.middleware).addHandler(get));
    RouterCenter.router.post(RouterName.userProfileAddress, Pipeline().addMiddleware(AuthenMiddleware.middleware).addHandler(addAddress));
    RouterCenter.router.delete(RouterName.userProfileAddress, Pipeline().addMiddleware(AuthenMiddleware.middleware).addHandler(deleteAddress));
  }
}
