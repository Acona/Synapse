import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Stay awake hint shown'),
          subtitle: const Text(
            '(Device option is already enabled on your phone)',
          ),
          value: true,
          onChanged: (_) {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Version'),
          subtitle: const Text('Dev scaffold'),
        ),
      ],
    );
  }
}
