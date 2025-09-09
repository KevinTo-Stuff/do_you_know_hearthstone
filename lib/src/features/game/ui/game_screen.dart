// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/core/logic/player/player_cubit.dart';
import 'package:do_you_know_hearthstone/src/core/theme/dimens.dart';
import 'package:do_you_know_hearthstone/src/features/game/logic/game_cubit.dart';
import 'package:do_you_know_hearthstone/src/shared/components/buttons/button.dart';

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
        appBar: AppBar(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<PlayerCubit, PlayerState>(
                builder: (context, state) => Text(
                  state.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text('Score: 0', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(Dimens.spacing),
          children: [
            Button.primary(
              title: 'Generate Card',
              onPressed: () => {context.read<GameCubit>().generateCard()},
            ),
            const SizedBox(height: Dimens.spacing),
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.spacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.card.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.card.flavor,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      // Add more fields as needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
