import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themechanger/repositories/postrepository.dart';
import 'package:themechanger/screens/home/home.dart';
import 'package:themechanger/screens/themes/theme_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        Provider(create: (_) => FakePostRepository()),
      ],
      child: Consumer(
        builder: (BuildContext context, ThemeManager manager, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: manager.themeData,
            home: HomePage(title: 'Home'),
          );
        }
      )
    );
  }

}

