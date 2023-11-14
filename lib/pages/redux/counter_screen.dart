import 'package:auto_route/auto_route.dart';
import 'package:counterapp/pages/redux/counter_action.dart';
import 'package:counterapp/pages/redux/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

@RoutePage()
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Redux Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<CounterState, int>(
              converter: (store) => store.state.count,
              builder: (context, count) => Text(
                count.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StoreConnector<CounterState, VoidCallback>(
                  converter: (store) => () => store.dispatch(DecrementAction()),
                  builder: (context, callback) => MaterialButton(
                    color: Colors.red,
                    elevation: 0.0,
                    height: 50,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: callback,
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                StoreConnector<CounterState, VoidCallback>(
                  converter: (store) => () => store.dispatch(IncrementAction()),
                  builder: (context, callback) => MaterialButton(
                    color: Colors.green,
                    elevation: 0.0,
                    height: 50,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: callback,
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
