// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/features/settings/logic/settings_cubit.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget implements AutoRouteWrapper {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => SettingsCubit(), child: this);
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: ListView(
          children: [
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) => ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark Mode'),
                    trailing: Switch(
                      value: state.darkMode,
                      onChanged: (value) {
                        context.read<SettingsCubit>().setDarkMode(value);
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.music_note),
                    title: const Text('Sound'),
                    trailing: Switch(
                      value: state.mute,
                      onChanged: (value) {
                        context.read<SettingsCubit>().setMute(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.warning),
              title: const Text('Difficulty'),
              trailing: DropdownButton<String>(
                value: 'Normal',
                items: const [
                  DropdownMenuItem(value: 'Easy', child: Text('Easy')),
                  DropdownMenuItem(value: 'Normal', child: Text('Normal')),
                  DropdownMenuItem(value: 'Hard', child: Text('Hard')),
                ],
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
