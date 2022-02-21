import 'package:athlon_task/presentation/screens/profile/widgets/avatar/avatar_provider.dart';
import 'package:athlon_task/presentation/screens/profile/widgets/avatar/avatar_state.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:athlon_task/shared/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AvatarSection extends StatelessWidget {
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.medium),
      child: Text('Avatar', style: AthlonTypo.lightStyle),
    );
  }

  Widget _buildProfilePicture(AvatarState state) {
    final size = 80.0;
    final profilePicturePath = state.customer?.profilePicturePath;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: profilePicturePath != null
            ? DecorationImage(
                image: NetworkImage(profilePicturePath),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AvatarState>();
    return AvatarProvider(
      child: SizedBox(
        height: 160.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Row(
              children: [
                _buildProfilePicture(state),
                SizedBox(width: Dimens.medium),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        state.customer?.profilePicturePath?.split('/').last ??
                            '',
                        style: AthlonTypo.defaultStyle.copyWith()),
                    SizedBox(height: Dimens.atom),
                    Text('Uploaded ${state.customer?.profilePictureUploadDate}',
                        style: AthlonTypo.lightStyle.copyWith(fontSize: 14.0))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
