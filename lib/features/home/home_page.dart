import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            key: const ValueKey('home_content'),
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Synapse', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              Text(
                'Base UI scaffold is live. Use this as the safe point for adding features.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const _Counter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Counter extends StatefulWidget {
  const _Counter();

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        FilledButton(
          onPressed: () => setState(() => _count++),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
