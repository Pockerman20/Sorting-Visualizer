// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sortingvisualizer/bloc/input_bloc/input_bloc.dart';
import 'package:sortingvisualizer/bloc/theme_bloc/theme_bloc.dart';
import 'package:sortingvisualizer/pages/home_page.dart';
import 'package:sortingvisualizer/pages/launch_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(Wrapper());
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: InputBloc()),
        BlocProvider.value(value: ThemeBloc()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (BuildContext context, ThemeMode themeMode) {
        return MaterialApp(
          title: 'Sorting Visualizer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            iconTheme: IconThemeData(
              color: Colors.grey.shade800,
            ),
            textTheme: TextTheme(
              button: TextStyle(color: Colors.white),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            hintColor: Colors.blueAccent,
            // buttonColor: Colors.blueAccent,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent,
            ),
            iconTheme: IconThemeData(
              color: Colors.grey.shade100,
            ),
          ),
          themeMode: themeMode,
          // home: LaunchScreen(),
          initialRoute: '/',
          routes: {
            '/': (context) => LaunchScreen(),
            '/home': (context) => HomePage(),
          },
        );
      },
    );
  }
}
