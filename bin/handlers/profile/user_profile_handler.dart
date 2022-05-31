import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/src/request.dart';

import 'package:shelf/src/response.dart';

import '../../custom_handler.dart';
import '../../custom_response.dart';
import '../../repositories/repositories.dart';
import '../../routers/routers.dart';
import '../../services/profile_service/profile_service.dart';

class UserProfileHandler extends CustomHandler {
  final IProfileService _profileService = ProfileService(ProfileRepository());

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

  Future<Response> addAddress(Request req, String userId) async {
    print('Log update url: ${req.url}');
    Map<String, dynamic> body = jsonDecode(await req.readAsString());
    return _profileService.addAddress(userId: userId, address: body['address']);
  }


  Future<Response> deleteAddress(Request req, String userId) async {
    print('Log update url: ${req.url}');
    Map<String, dynamic> body = jsonDecode(await req.readAsString());
    return _profileService.deleteAddress(userId: userId, address: body['address']);
  }

  @override
  void registerToRouter() {
    RouterCenter.router.get(RouterName.userProfile, getProfile);
    RouterCenter.router.put(RouterName.userProfile, updateProfile);
    RouterCenter.router.post(RouterName.userProfileAddress, addAddress);
    RouterCenter.router.delete(RouterName.userProfileAddress, deleteAddress);
  }
}
