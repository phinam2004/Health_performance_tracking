import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shared/theme/app_theme.dart';
import 'features/ring_today/presentation/pages/today_screen.dart';
import 'features/health_metrics/presentation/pages/metabolism/metabolism_screen.dart';
import 'features/health_metrics/presentation/pages/zones/zones_screen.dart';
import 'features/discover/presentation/pages/discover_screen.dart';
import 'features/profile/presentation/pages/profile_screen.dart';

void main() {
  runApp(const UltrahumanApp());
}

class UltrahumanApp extends StatelessWidget {
  const UltrahumanApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style for dark theme
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF1A1A1A),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'Ultrahuman Health Performance',
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TodayScreen(),
    const MetabolismScreen(),
    const ZonesScreen(),
    const DiscoverScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          border: Border(top: BorderSide(color: Color(0xFF333333), width: 0.5)),
        ),
        child: SafeArea(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFF1A1A1A),
            selectedItemColor: const Color(0xFF00D4AA),
            unselectedItemColor: const Color(0xFFAAAAAA),
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.circle_outlined, size: 24),
                label: 'RING',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined, size: 24),
                label: 'METABOLISM',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.groups_outlined, size: 24),
                label: 'ZONES',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined, size: 24),
                label: 'DISCOVER',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 24),
                label: 'PROFILE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
