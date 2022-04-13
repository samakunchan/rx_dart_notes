import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_dart_notes/pages/home_page.dart';
import 'core/services/notes_service.dart';

void setUpLocator(){
  GetIt.I.registerLazySingleton(() => NoteService());
}

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage()
    );
  }
}

