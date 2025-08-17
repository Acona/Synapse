import 'package:flutter/material.dart';

/// Simple dashboard with three big cards.
/// Tapping a card calls [onSelect] with the target tab index.
class DashboardScreen extends StatelessWidget {
  final ValueChanged<int> onSelect; // 0=Home, 1=Camera, 2=Uploads, 3=Search
  const DashboardScreen({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _DashCard(
          title: 'Camera',
          subtitle: 'Capture • Review • Queue',
          icon: Icons.camera_alt,
          onTap: () => onSelect(1),
        ),
        const SizedBox(height: 16),
        _DashCard(
          title: 'Upload Queue',
          subtitle: 'Pending • Failed • Manual',
          icon: Icons.cloud_upload,
          onTap: () => onSelect(2),
        ),
        const SizedBox(height: 16),
        _DashCard(
          title: 'Search Hub',
          subtitle: 'Products • Molds • Machines',
          icon: Icons.search,
          onTap: () => onSelect(3),
        ),
      ],
    );
  }
}

class _DashCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final VoidCallback onTap;
  const _DashCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
