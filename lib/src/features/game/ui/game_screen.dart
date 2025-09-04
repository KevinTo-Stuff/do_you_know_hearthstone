// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/features/game/logic/game_cubit.dart';

@RoutePage()
class GameScreen extends StatefulWidget implements AutoRouteWrapper {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => GameCubit(), child: this);
  }
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listener: (context, state) => {},
      child: Scaffold(
        appBar: AppBar(title: const Text('Hearthstone Game')),
        body: Center(
          child: Text(
            'Welcome to Hearthstone!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
