import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'features/counter/domain/repositories/counter_repository.dart';
import 'features/counter/domain/services/get_limit.dart';
import 'features/counter/domain/services/set_limit.dart';
import 'features/counter/presentation/bloc/counter_bloc.dart';
import 'features/counter/presentation/pages/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio(); // Create Dio instance

    final GetLimit getLimit = GetLimit(dio, baseUrl: "http://127.0.0.1:8000");
    final SetLimit setLimit = SetLimit(dio, baseUrl: "http://127.0.0.1:8000");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Counter App',
      theme: ThemeData(
       
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(getLimit: getLimit, setLimit: setLimit),
        child: CounterPage(),
      ),
    );
  }
}
