import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/bloc/bloc_bloc.dart';
import 'package:flutter_applicationtest/view/mypage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Blocs(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
