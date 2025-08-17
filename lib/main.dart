import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// Screens
import 'screens/camera_screen/camera_screen.dart';
import 'screens/search_hub_screen/search_hub_screen.dart';
import 'screens/upload_queue_screen/upload_queue_screen.dart';

// Global cameras list (filled before runApp)
late final List<CameraDescription> deviceCameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    deviceCameras = await availableCameras();
  } catch (_) {
    deviceCameras = <CameraDescription>[];
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dark theme tuned to your green
    final seed = const Color(0xFF16A34A);
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      title: 'Synapse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0F1512),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0F1512)),
        cardColor: const Color(0xFF121A16),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  late final List<Widget> _pages = <Widget>[
    // Pass cameras to CameraScreen when we wire it up; stub for now
    const CameraScreen(),
    const SearchHubScreen(),
    const UploadQueueScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ['Camera', 'Search', 'Uploads'][_index],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.camera_alt_outlined),
            selectedIcon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.cloud_upload_outlined),
            selectedIcon: Icon(Icons.cloud_upload),
            label: 'Uploads',
          ),
        ],
      ),
    );
  }
}
