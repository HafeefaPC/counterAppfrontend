import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'features/counter/domain/repositories/counter_repository.dart';
import 'features/counter/presentation/bloc/counter_bloc.dart';
import 'features/counter/presentation/pages/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();
    final String baseUrl = "http://127.0.0.1:8000";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CounterRepository>(
            create: (context) => CounterRepository(dio: dio, baseUrl: baseUrl),
          ),
 
        ],
        child: BlocProvider(
          create: (context) => CounterBloc(
            counterRepository: RepositoryProvider.of<CounterRepository>(context),
          ),
          child: CounterPage(),
        ),
      ),
    );
  }
}
