import 'package:coffe_shop_mobile_app/deneme/blocDeneme/counterBloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BLocBuilderDagitici extends StatelessWidget {
  const BLocBuilderDagitici({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const BlocDenemeUi(),
    );
  }
}

class BlocDenemeUi extends StatefulWidget {
  const BlocDenemeUi({super.key});

  @override
  State<BlocDenemeUi> createState() => _BlocDenemeUiState();
}

class _BlocDenemeUiState extends State<BlocDenemeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocDenemeUi'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => context.read<CounterCubit>().increment(),
                        child: const Text(
                          'Increment',
                        )),
                    ElevatedButton(
                        onPressed: () => context.read<CounterCubit>().decrement(),
                        child: const Text(
                          'Decrement',
                        )),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
