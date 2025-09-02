import 'package:flutter/material.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Settings'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: true,
              onChanged: (bool value) {},
            ),
            ListTile(
              title: const Text('Theme'),
              trailing: DropdownButton<String>(
                value: 'Light',
                items: const [
                  DropdownMenuItem(value: 'Light', child: Text('Light')),
                  DropdownMenuItem(value: 'Dark', child: Text('Dark')),
                ],
                onChanged: (String? value) {},
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Save'),
          onPressed: () {
            // Save settings logic here
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

// Usage example:
// showDialog(
//   context: context,
//   builder: (context) => const SettingsDialog(),
// );
