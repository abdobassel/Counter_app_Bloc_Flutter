import 'package:bloc_counter/bloc/bloc_oserver.dart';
import 'package:bloc_counter/bloc/cubit.dart';
import 'package:bloc_counter/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MYCounterApp(),
    );
  }
}

class MYCounterApp extends StatelessWidget {
  const MYCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(InitState()),
      child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text('Counter'),
              ),
              body: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.blue,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    icon: Icon(
                      Icons.minimize,
                    ),
                    iconSize: 30,
                  )
                ],
              )),
            );
          }),
    );
  }
}
