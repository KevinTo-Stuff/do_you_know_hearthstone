part of 'start_controller.dart';

sealed class StartState extends Equatable {
  final String name;

  const StartState({required this.name});
}

final class StartInitial extends StartState {
  const StartInitial({required super.name});

  @override
  List<Object?> get props => [name];
}
