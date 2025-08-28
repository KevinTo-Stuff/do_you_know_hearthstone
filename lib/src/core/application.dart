import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:do_you_know_hearthstone/src/core/routing/app_router.dart';
import 'package:do_you_know_hearthstone/src/shared/locator.dart';
import 'package:do_you_know_hearthstone/src/core/environment.dart';
import 'package:do_you_know_hearthstone/src/core/theme/app_theme.dart';

class Application extends StatelessWidget {
  final AppRouter _appRouter;

  Application({super.key, AppRouter? appRouter})
    : _appRouter = appRouter ?? locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Environment.appName,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
