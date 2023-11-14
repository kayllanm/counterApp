import 'package:counterapp/config/router.dart';
import 'package:counterapp/pages/bloC/counter_bloc.dart';
import 'package:counterapp/pages/redux/counter_reducer.dart';
import 'package:counterapp/pages/redux/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<CounterState>(
    counterReducer,
    initialState: const CounterState(),
  );
  
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CounterState> store;
  
  MyApp(this.store, {super.key});

    /// create an instance of `AppRouter`
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: store,
      child: BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _appRouter.config(),
      ),
    ),
    );
  }
}


