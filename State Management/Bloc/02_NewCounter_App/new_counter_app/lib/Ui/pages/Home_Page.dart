// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_counter_app/Bloc/bloc/counter_bloc.dart';
import 'package:new_counter_app/Ui/components/My_Button.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: counterBloc,
      // listenWhen: (previous, current) {

      // },

      // buildWhen: (previous, current) {

      // },
      listener: (context, state) {},
      builder: (context, state) {
        final int counter = state.counter;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Counter App",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.deepPurple[300],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text

              Center(
                child: Text(
                  counter.toString(),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Increment Button
                  My_Button(
                    onTap: () {
                      counterBloc.add(DecrementButtonClickedEvent());
                    },
                    text: 'Decrement',
                  ),

                  SizedBox(width: 20),

                  // decrement Button

                  My_Button(
                    onTap: () {
                      counterBloc.add(IncrementButtonClickedEvent());
                    },
                    text: 'Increment',
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
