import 'package:shelf/src/response.dart';

import '../../custom_response.dart';
import '../../data/mock_data/mock_data.dart';
import '../../services/profile_service/profile_service.dart';

class ProfileRepository implements IProfileService {
  @override
  Future<Response> getProfile({required String userId}) async {
    try {
      final user = UserMockData.users.firstWhere((element) => element.id == userId);
      return CustomResponse(statusCode: 200, data: user);
    } catch (e) {
      return CustomResponse(statusCode: 404, message: 'Không tìm thấy thông tin này theo id ${userId}');
    }
  }

  @override
  Future<Response> updateAddress({required String userId, required String address}) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }

  @override
  Future<Response> updateProfileInfo({required String userId, required String userName, required String dateOfBirth}) async {
    try {
      final user = UserMockData.users.firstWhere((element) => element.id == userId);
      user.dateOfBirth = dateOfBirth;
      user.userName = userName;
      return CustomResponse(statusCode: 200, data: user);
    } catch (e) {
      return CustomResponse(statusCode: 404, message: 'Không tìm thấy thông tin này theo id ${userId}');
    }
  }

  @override
  Future<Response> deleteAddress({required String userId, required String address}) async {
    try {
      final user = UserMockData.users.firstWhere((element) => element.id == userId);
      user.addresses?.remove(address);
      return CustomResponse(statusCode: 200, data: user);
    } catch (e) {
      return CustomResponse(statusCode: 404, message: 'Không tìm thấy thông tin này theo id ${userId}');
    }
  }

  @override
  Future<Response> addAddress({required String userId, required String address}) async {
    try {
      final user = UserMockData.users.firstWhere((element) => element.id == userId);
      if (user.addresses != null) {
        user.addresses?.add(address);
      } else {
        user.addresses = [address];
      }
      return CustomResponse(statusCode: 200, data: user);
    } catch (e) {
      return CustomResponse(statusCode: 404, message: 'Không tìm thấy thông tin này theo id ${userId}');
    }
  }
}
