// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/Features/Bloc/bloc/counter_bloc.dart';

class Counter_Page extends StatefulWidget {
  const Counter_Page({super.key});

  @override
  State<Counter_Page> createState() => _Counter_PageState();
}

class _Counter_PageState extends State<Counter_Page> {
  final CounterBloc counterBloc = CounterBloc();
  @override
  void initState() {
    counterBloc.add(CounterInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
        },
        child: Icon(Icons.add),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: counterBloc,
        listenWhen: (previous, current) => current is CounterActionState,
        buildWhen: (previous, current) => current is! CounterActionState,
        listener: (context, state) {
          if (state is CounterResetState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Counter Reset")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final incrementState = state as CounterIncrementState;
              return Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text
                      Text(
                        incrementState.value.toString(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Reset Button

                      MaterialButton(
                        onPressed: () {
                          counterBloc.add(CounterResetEvent());
                        },
                        child: Text("Reset"),
                        color: Colors.deepPurple[100],
                      ),
                    ],
                  ),
                ),
              );

            default:
              return Center(
                child: Text("Child Not Found"),
              );
          }
        },
      ),
    );
  }
}
