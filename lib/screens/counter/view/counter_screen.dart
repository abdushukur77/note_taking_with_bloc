import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/styles/app_text_style.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Counter Screen")),
            body: Center(
              child: Text(
                state.toString(),
                //context.watch<CounterCubit>().state.toString(),
                style: AppTextStyle.interSemiBold.copyWith(fontSize: 24),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent(value: 10));
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 12),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
