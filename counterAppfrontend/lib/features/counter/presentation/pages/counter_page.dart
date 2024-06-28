import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';
import '../components/LimitPopup.dart';


class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Counter App',style: TextStyle(fontSize: 18,color: Colors.pink[200]),) , 
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterInitial) {
              context.read<CounterBloc>().add(FetchLimit());
              return CircularProgressIndicator();
            }
            if (state is CounterLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   SizedBox(height: 20),
                  Text(
                    'Counter Value: ${state.counterValue}',
                    style: TextStyle(fontSize: 18,color: Colors.pink[200]),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(Increment());
                        },
                        child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.blue[900], 
                       
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(Decrement());
                        },
                        child: Icon(Icons.remove),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          shape: CircleBorder(), 
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Limit: ${state.limit}',style: TextStyle(fontSize: 18,color: Colors.pink[200]),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final bloc = context.read<CounterBloc>();
                      int? newLimit = await showDialog<int>(
                        context: context,
                        builder: (context) => LimitPopup(currentLimit: state.limit),
                      );
                      if (newLimit != null) {
                        bloc.add(UpdateLimit(newLimit));
                      }
                    },
                    child: Text('Set Limit',style: TextStyle(fontSize: 18,color: Colors.pink[200]),),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900], 
                     
                    ),
                  ),
                  
                 
                ],
              );
            }
            if (state is CounterError) {
              return Text(state.message);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

