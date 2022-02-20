import 'package:athlon_task/data/backend/profile_service.dart';
import 'package:athlon_task/data/local/database_provider.dart';
import 'package:athlon_task/data/local/profile_dao.dart';
import 'package:athlon_task/data/model/profile.dart';

class ProfileRepository {
  final profileDao = ProfileDao();

  DatabaseProvider databaseProvider;

  ProfileService profileService;

  ProfileRepository(this.profileService, this.databaseProvider);

  Future<Profile> getProfile() async {
    final map = await profileService.getProfile();
    return Profile.fromJson(map);
  }
}
