// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:do_you_know_hearthstone/src/core/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: ListView(
          children: [
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) => ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: state.darkMode,
                  onChanged: (value) {
                    context.read<SettingsCubit>().setDarkMode(value);
                  },
                ),
              ),
            ),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) => ListTile(
                leading: const Icon(Icons.music_note),
                title: const Text('Sound'),
                trailing: Switch(
                  value: state.mute,
                  onChanged: (value) {
                    context.read<SettingsCubit>().setMute(value);
                  },
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {},
            ),
            const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.warning),
            //   title: const Text('Difficulty'),
            //   trailing: DropdownButton<String>(
            //     value: Difficulty,
            //     items: const [
            //       DropdownMenuItem(value: Difficulty.easy, child: Text('Easy')),
            //       DropdownMenuItem(value: Difficulty.normal, child: Text('Normal')),
            //       DropdownMenuItem(value: Difficulty.hard, child: Text('Hard')),
            //     ],
            //     onChanged: (value) {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
