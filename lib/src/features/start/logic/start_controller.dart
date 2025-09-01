// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:equatable/equatable.dart';

part 'start_state.dart';

class StartController extends ValueNotifier<StartState> {
  StartController() : super(StartInitial(name: ''));
}
