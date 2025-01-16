import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:zad/views/adminScreen.dart';
import 'package:zad/views/volunteer_screens/volunteer_dashboard_screen.dart';
import 'controllers/providers/theme_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initLocalStorage();
  runApp(
      MultiProvider(providers: [
            ChangeNotifierProvider(create: (context) => theme()),
          ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zad',
      theme: context.watch<theme>().dark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      // home: const AuthWrapper(),
      // home: DonorDashboardScreen(),
      // home: VolunteerDashboardScreen(),
      // home: ProfileScreen(),
      home: AdminScreen(),
    );
  }
}
