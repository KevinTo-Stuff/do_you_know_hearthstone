import 'package:flutter_bloc/flutter_bloc.dart';

part 'start_state.dart';

class StartCubit extends Cubit<StartState> {
  StartCubit() : super(const _StartInitial(name: ''));

  void onEmailChanged(String name) {
    emit(_StartInitial(name: name));
  }

  void start() async {
    emit(StartState.success(name: state.name));
  }
}
