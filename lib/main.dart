import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_eg1/users_list/view_models/users_view_model.dart';
import 'package:provider_mvvm_eg1/users_list/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
