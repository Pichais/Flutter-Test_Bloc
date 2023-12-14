import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/bloc/bloc_bloc.dart';
import 'package:flutter_applicationtest/bloc/bloc_state.dart';
import 'package:flutter_applicationtest/view/second_page/bloc/bloc_scond.dart';
import 'package:flutter_applicationtest/view/second_page/bloc/bloc_scond_event.dart';
import 'package:flutter_applicationtest/view/second_page/bloc/bloc_second_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: BlocProvider.of<Blocs>(context),
          ),
          BlocProvider(
            create: (context) => BlocSecondPage(),
          ),
        ],
        child: BlocBuilder<Blocs, BlocState>(
          builder: (context, state) {
            if (state is BlocLoading) {
              return const Scaffold(
                body: SafeArea(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<BlocSecondPage, CounterState>(
                  buildWhen: (previous, current) {
                    return previous != current;
                  },
                  builder: (context, state) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Second Page counter => ${state.counter}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () =>
                                      context.read<BlocSecondPage>().add(IncrementCounter()),
                                  icon: const Icon(Icons.add)),
                              IconButton(
                                  onPressed: () =>
                                      context.read<BlocSecondPage>().add(DecrementCounter()),
                                  icon: const Icon(Icons.remove))
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                BlocListener<BlocSecondPage, CounterState>(
                  listener: (context, state) {
                    if ((state.counter % 2) == 0) {
                      const snackBar = SnackBar(
                        content: Text('Yay! A Even Number!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (state.counter >= 10) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Test system'),
                ),
                BlocConsumer<BlocSecondPage, CounterState>(builder: (context, state) {
                  return const Center(
                    child: Text('This is BlocConsumer'),
                  );
                }, listener: (context, state) {
                  if (state.counter == 10) {
                    print('10');
                  }
                }),
                // BlocSelector(selector: selector, builder: builder)
              ],
            );
          },
        ),
      ),
    );
  }
}
