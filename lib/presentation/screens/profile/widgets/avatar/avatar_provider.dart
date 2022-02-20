import 'package:athlon_task/data/backend/profile_service.dart';
import 'package:athlon_task/data/backend/plugins/dio_http_service.dart';
import 'package:athlon_task/data/backend/plugins/http_service_interface.dart';
import 'package:athlon_task/data/local/database_provider.dart';
import 'package:athlon_task/data/repositories/profile_repository.dart';
import 'package:athlon_task/presentation/screens/profile/widgets/avatar/avatar_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'avatar_state.dart';

class AvatarProvider extends StatelessWidget {
  final Widget child;

  const AvatarProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HttpServiceInterface>(
            create: (_) => DioHttpService(
                  'https://something.com',
                )),
        ProxyProvider<HttpServiceInterface, ProfileService>(
          update: (
            BuildContext context,
            HttpServiceInterface httpService,
            ProfileService? customerService,
          ) =>
              ProfileService(
                  httpService: DioHttpService(
            'https://something.com',
          )),
        ),
        ProxyProvider<HttpServiceInterface, ProfileRepository>(
            update: (
          BuildContext context,
          HttpServiceInterface httpService,
          ProfileRepository? customerRepository,
        ) =>
                ProfileRepository(
                    context.read<ProfileService>(), DatabaseProvider.get)),
        ChangeNotifierProxyProvider<ProfileRepository, AvatarState>(
            create: (context) => AvatarState(
                customerRepository: context.read<ProfileRepository>()),
            update: (BuildContext context,
                    ProfileRepository customerRepository,
                    AvatarState? avatarModel) =>
                AvatarState(customerRepository: customerRepository)),
      ],
      child: child,
    );
  }
}
