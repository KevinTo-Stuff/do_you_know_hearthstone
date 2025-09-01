// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/core/app_initializer.dart';
import 'package:do_you_know_hearthstone/src/core/application.dart';

void main() {
  final AppInitializer appInitializer = AppInitializer();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await appInitializer.preAppRun();

    runApp(Application());

    appInitializer.postAppRun();
  }, (error, stack) {});
}
