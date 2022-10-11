import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneznik_app/screens/bottom_bar.dart';
import 'package:sneznik_app/services/category_service.dart';
import 'package:sneznik_app/utils/app_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(MultiProvider(providers: [Provider(create: (_) => CategoryService())], child: const MyApp(),));
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.epilogueTextTheme(
          Theme.of(context).textTheme,
        ),

        primaryColor: primary,
      ),
      home: const BottomBar(),
    );
  }
}