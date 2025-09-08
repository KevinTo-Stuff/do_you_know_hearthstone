// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/core/environment.dart';
import 'package:do_you_know_hearthstone/src/core/logic/player/player_cubit.dart';
import 'package:do_you_know_hearthstone/src/core/logic/settings/settings_cubit.dart';
import 'package:do_you_know_hearthstone/src/core/routing/app_router.dart';
import 'package:do_you_know_hearthstone/src/core/theme/app_theme.dart';
import 'package:do_you_know_hearthstone/src/shared/locator.dart';

class Application extends StatelessWidget {
  final AppRouter _appRouter;

  Application({super.key, AppRouter? appRouter})
    : _appRouter = appRouter ?? locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (BuildContext context) => SettingsCubit(),
        ),
        BlocProvider<PlayerCubit>(
          create: (BuildContext context) => PlayerCubit(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) => MaterialApp.router(
          title: Environment.appName,
          routerConfig: _appRouter.config(
            navigatorObservers: () => [AutoRouteObserver()],
          ),
          theme: state.darkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
