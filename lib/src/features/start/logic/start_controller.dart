import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'start_state.dart';

class StartController extends ValueNotifier<StartState> {
  StartController() : super(StartInitial(name: ''));
}
