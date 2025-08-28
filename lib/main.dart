// https://github.com/stevenosse/flutter_kit/tree/master

import 'dart:async';

import 'package:flutter/material.dart';
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
