// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(_GameInitial(score: 0));
}
