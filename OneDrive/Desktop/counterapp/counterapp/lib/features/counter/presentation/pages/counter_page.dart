import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterInitial) {
              context.read<CounterBloc>().add(LoadLimit());
              return Container(
                child: CircularProgressIndicator(),
              
              );
            }
            if (state is CounterLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Counter Value: ${state.counterValue}',
                   
                  ),
                  Text(
                    'Limit: ${state.limit}',
                   
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(Increment());
                        },
                        child: Text('Increment'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(Decrement());
                        },
                        child: Text('Decrement'),
                      ),
                    ],
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
                        bloc.add(SetLimit(newLimit));
                      }
                    },
                    child: Text('Set Limit'),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class LimitPopup extends StatefulWidget {
  final int currentLimit;

  LimitPopup({required this.currentLimit});

  @override
  _LimitPopupState createState() => _LimitPopupState();
}

class _LimitPopupState extends State<LimitPopup> {
  late int _newLimit;

  @override
  void initState() {
    super.initState();
    _newLimit = widget.currentLimit;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Set Limit'),
      content: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Enter new limit'),
        onChanged: (value) {
          _newLimit = int.tryParse(value) ?? widget.currentLimit;
        },
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(_newLimit);
          },
          child: Text('Set'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
