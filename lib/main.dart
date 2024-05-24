import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/provider/card_todo_color_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/provider/data_time_provider.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/view/screen/home_screen.dart';

import 'theme/dark_light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CardTodoColorProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TodoService(),
          ),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => RadioProvider()),
          ChangeNotifierProvider(create: (context) => DateTimeProvider())
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
                theme: value.themeData,
                debugShowCheckedModeBanner: false,
                home: HomeScreen());
          },
        ));
  }
}
