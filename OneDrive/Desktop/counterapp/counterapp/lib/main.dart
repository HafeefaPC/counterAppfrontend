import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'features/counter/domain/repositories/counter_repository.dart';
import 'features/counter/domain/usecases/get_limit.dart';
import 'features/counter/domain/usecases/set_limit.dart';
import 'features/counter/presentation/bloc/counter_bloc.dart';
import 'features/counter/presentation/pages/counter_page.dart';


void main()  {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterRepository repository = CounterRepository();
    final GetLimit getLimit = GetLimit(repository);
    final SetLimit setLimit = SetLimit(repository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(getLimit: getLimit, setLimit: setLimit),
        child: CounterPage(),
      ),
    );
  }
}
