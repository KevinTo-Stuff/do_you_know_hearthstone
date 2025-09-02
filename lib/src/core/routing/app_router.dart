// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/features/start/ui/start_screen.dart';
import 'package:do_you_know_hearthstone/src/features/settings/ui/settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: StartRoute.page, initial: true),
    AutoRoute(page: SettingsRoute.page),
  ];
}
