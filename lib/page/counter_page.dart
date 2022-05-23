import 'package:bloc_api_fetching_flutter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

  @override
  Widget build(BuildContext context) {
    // final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context)
    //   ..add(IncrementEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          print('state is: ${state}');
          if (state is IncrementCountState) {
            print('CountValue: ${state.counter}');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    state.counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("click");
          //counterBloc.add(IncrementEvent());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
