import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core_d_i.dart';
import 'package:flutter_test_project/features/home/data/bloc/user/bloc.dart';
import 'package:flutter_test_project/features/home/data/bloc/user/events.dart';

import 'package:flutter_test_project/features/home/presentation/home_screen.dart';
import 'package:get_it/get_it.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    CoreDi.register();
    await CoreDi.get.allReady();

    runApp(const MyApp());
  }, (error, stackTrace) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create: (context) => GetIt.instance<UsersBloc>()..add(ReadUsers()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
