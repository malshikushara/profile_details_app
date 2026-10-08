import 'package:flutter/material.dart';

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: const Color(0xFF252529),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF252529),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF252529),
          foregroundColor: Colors.white,
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _points = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile', style: TextStyle(fontSize: 20))),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 100),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: ProfileAvatar()),
                  const SizedBox(height: 26),
                  const Divider(color: Color(0xFF616161), thickness: 1),
                  const SizedBox(height: 14),
                  const Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const SelectableText('Malshi', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 24),
                  const Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.email, size: 20),
                      SizedBox(width: 8),
                      Expanded(child: SelectableText('malshikushara@gmail.com', style: TextStyle(fontSize: 16))),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Points', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(Icons.star, size: 20),
                    const SizedBox(width: 8),
                    Text('$_points', key: const Key('pointsValue'), style: const TextStyle(fontSize: 16)),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add one point',
        onPressed: () => setState(() => _points++),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Verified profile avatar',
      image: true,
      child: SizedBox(
        width: 104,
        height: 104,
        child: Stack(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFE3E8E8),
              child: Icon(Icons.person, size: 78, color: Color(0xFF394349)),
            ),
            Positioned(
              right: 0,
              bottom: 3,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(color: Color(0xFFFAFAFA), shape: BoxShape.circle),
                child: const Icon(Icons.check_circle, color: Color(0xFF43A047), size: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
