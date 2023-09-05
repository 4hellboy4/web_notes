import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_web/providers/login_provider.dart';
import 'package:notes_web/providers/notes_provider.dart';
import 'package:notes_web/providers/sign_up_provider.dart';
import 'package:notes_web/router/my_router.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBerFp4oMH3UIH4zYhWrk3H05tgqzZ2k7o",
        appId: "notsy-4a017.firebaseapp.com",
        messagingSenderId: "556320047593",
        projectId: "notsy-4a017",
      ),
    );
  }

  await Firebase.initializeApp();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotesProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Notes Web',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
          useMaterial3: true,
        ),
        routeInformationProvider: MyRouter.router.routeInformationProvider,
        routeInformationParser: MyRouter.router.routeInformationParser,
        routerDelegate: MyRouter.router.routerDelegate,
      ),
    );
  }
}
