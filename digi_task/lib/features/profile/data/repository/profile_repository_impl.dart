import 'package:digi_task/features/profile/data/service/profile_network_service.dart';
import 'package:digi_task/injection.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/repository/profile_repository.dart';
import '../model/profile_model.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  final _profileService = getIt.get<ProfileNetworkService>();
  @override
  Future<Result<UserProfileModel, Exception>> getUserInformation() async {
    try {
      final response = await _profileService.getUserInformation();
      return Success(response);
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
