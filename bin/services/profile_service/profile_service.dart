import 'package:shelf/shelf.dart';

import '../../repositories/repositories.dart';

abstract class IProfileService {
  Future<Response> updateProfileInfo({required String userId, required String userName, required String dateOfBirth});

  Future<Response> getProfile({
    required String userId,
  });

  Future<Response> updateAddress({required String userId, required String address});

  Future<Response> deleteAddress({required String userId, required String address});

  Future<Response> addAddress({required String userId, required String address});
}

class ProfileService implements IProfileService {
  final ProfileRepository profileRepository;

  ProfileService(this.profileRepository);

  @override
  Future<Response> getProfile({required String userId}) {
    return profileRepository.getProfile(userId: userId);
  }

  @override
  Future<Response> updateProfileInfo({required userId, required String userName, required String dateOfBirth}) {
    return profileRepository.updateProfileInfo(userId: userId, userName: userName, dateOfBirth: dateOfBirth);
  }

  @override
  Future<Response> addAddress({required String userId, required String address}) {
    return profileRepository.addAddress(userId: userId, address: address);
  }

  @override
  Future<Response> deleteAddress({required String userId, required String address}) {
    return profileRepository.deleteAddress(userId: userId, address: address);
  }

  @override
  Future<Response> updateAddress({required String userId, required String address}) {
    return profileRepository.addAddress(userId: userId, address: address);
  }
}
