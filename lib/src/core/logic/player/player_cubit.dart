// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(_PlayerInitial(name: ''));

  void setName(String name) {
    emit(_PlayerInitial(name: name));
  }
}
