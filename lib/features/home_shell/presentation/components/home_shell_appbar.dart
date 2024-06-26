import 'package:flutter/material.dart';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/components/appbar_with_icon_component.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/custom_appbar.dart';
import '../../../../gen/my_assets.dart';

class HomeShellAppBar extends StatelessWidget {
  const HomeShellAppBar({super.key});

  static final IList<String> _noAppBarLocations = IListConst([
    const MapRoute().location,
  ]);

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).routeLocation;

    /// Home Tab
    if (location == const HomeRoute().location) {
      return CustomAppBar(
        centerTitle: true,
        title: Text(
          tr(context).appName,
          style: TextStyles.f20(context).copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }

    /// Settings Orders
    else if (location == const SettingsRoute().location) {
      return CustomAppBar(
        centerTitle: true,
        title: AppBarWithIconComponent(
          icon: MyAssets.ASSETS_ICONS_SCREENS_ICONS_SETTINGS_PNG,
          title: tr(context).orders,
        ),
      );
    }

    /// Profile Tab
    else if (location == const ProfileRoute().location) {
      return CustomAppBar(
        centerTitle: true,
        title: AppBarWithIconComponent(
          icon: MyAssets.ASSETS_ICONS_SCREENS_ICONS_PROFILE_PNG,
          title: tr(context).myProfile,
        ),
      );
    }

    /// Settings Tab
    else if (location == const SettingsRoute().location) {
      return CustomAppBar(
        centerTitle: true,
        title: AppBarWithIconComponent(
          icon: MyAssets.ASSETS_ICONS_SCREENS_ICONS_SETTINGS_PNG,
          title: tr(context).settings,
        ),
      );
    } else if (location == const LanguageRoute().location) {
      return CustomAppBar(
        hasBackButton: true,
        centerTitle: true,
        title: AppBarWithIconComponent(
          icon: MyAssets.ASSETS_ICONS_SCREENS_ICONS_LANGUAGE_PNG,
          title: tr(context).language,
        ),
      );
    }


     

    return const CustomAppBar();
  }
}

extension StatefulNavigationShellX on StatefulNavigationShell {
  bool get currentLocationHasAppBar {
    final location = shellRouteContext.routerState.routeLocation;
    return !HomeShellAppBar._noAppBarLocations.contains(location);
  }
}
