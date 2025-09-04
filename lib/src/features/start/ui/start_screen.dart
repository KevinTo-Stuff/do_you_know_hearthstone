// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/core/routing/app_router.dart';
import 'package:do_you_know_hearthstone/src/core/theme/dimens.dart';
import 'package:do_you_know_hearthstone/src/features/start/logic/start_cubit.dart';
import 'package:do_you_know_hearthstone/src/shared/components/buttons/button.dart';
import 'package:do_you_know_hearthstone/src/shared/components/form/input.dart';
import 'package:do_you_know_hearthstone/src/shared/extensions/context_extensions.dart';

@RoutePage()
class StartScreen extends StatefulWidget implements AutoRouteWrapper {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => StartCubit(), child: this);
  }
}

class _StartScreenState extends State<StartScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartCubit, StartState>(
      listener: (state, context) {},
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(Dimens.spacing),
            children: [
              const SizedBox(height: Dimens.tripleSpacing),
              Text(
                'Do you know Hearthstone?',
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: Dimens.minSpacing),
              Text(
                'Enter your name to start',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: Dimens.doubleSpacing),
              AutofillGroup(
                key: _formKey,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Input(
                        autofillHints: const [AutofillHints.email],
                        controller: _nameController,
                        labelText: 'Name',
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimens.spacing),
              Button.outline(
                title: '',
                onPressed: () =>
                    AutoRouter.of(context).push(const SettingsRoute()),
                icon: Icon(IconData(0xf04f1, fontFamily: 'MaterialIcons')),
              ),
              const SizedBox(height: Dimens.spacing),
              Button.primary(title: 'Start', onPressed: () => {}),
            ],
          ),
        ),
      ),
    );
  }
}
