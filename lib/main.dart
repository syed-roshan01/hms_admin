import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kwoxhpztkxzqetwanlxx.supabase.co', // 🔁 Replace with your actual Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3b3hocHp0a3h6cWV0d2FubHh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUxMjQyMTAsImV4cCI6MjA2MDcwMDIxMH0.jEIMSnX6-uEA07gjnQKdEXO20Zlpw4XPybfeLQr7W-M',              // 🔁 Replace with your actual anon public API key
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      debugShowCheckedModeBanner: false,
      home: const AdminHomeScreen(),
    );
  }
}
