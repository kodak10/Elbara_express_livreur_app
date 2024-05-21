import 'package:flutter/material.dart';

import '../../../auth/infrastructure/dtos/user_dto.dart';
import '../styles/styles.dart';
import '../utils/riverpod_framework.dart';
import '../widgets/cached_network_image_circular.dart';

class MainDrawerUserInfoComponent extends ConsumerWidget {
  const MainDrawerUserInfoComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final _userModel = ref.watch(userRepoProvider).userModel;
    //ignore this
    final userModel = UserDto.fromJson(const {});

    return Column(
      children: [
        CachedNetworkImageCircular(
          imageUrl: userModel.photoUrl,
          radius: 56,
        ),
        const SizedBox(
          height: Sizes.marginV6,
        ),
        Text(
          userModel.displayName!.isEmpty ? 'User${userModel.id.substring(0, 6)}' : userModel.displayName!,
          style: TextStyles.f18(context).copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.marginV2,
        ),
        Text(
          userModel.email,
          style: TextStyles.f14(context),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
