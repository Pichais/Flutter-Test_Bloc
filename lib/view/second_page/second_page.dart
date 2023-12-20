import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/bloc/bloc_bloc.dart';
import 'package:flutter_applicationtest/bloc/bloc_state.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_bloc.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_event.dart';
import 'package:flutter_applicationtest/view/fourth_page/fourth_page.dart';
import 'package:flutter_applicationtest/view/fourth_page/tab_storyandreels/story_cubit.dart';
import 'package:flutter_applicationtest/view/second_page/bloc/bloc_scond.dart';
import 'package:flutter_applicationtest/view/second_page/bloc/bloc_scond_event.dart';
import 'package:flutter_applicationtest/view/second_page/bloc/bloc_second_state.dart';
import 'package:flutter_applicationtest/view/third_page/bloc/third_bloc.dart';
import 'package:flutter_applicationtest/view/third_page/third_page.dart';
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
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute(context));
                    },
                    icon: const Icon(Icons.navigate_next_rounded),
                    label: const Text('Go to Third Page')),

                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(_createRouteFourthPage(context));
                    },
                    icon: const Icon(Icons.navigate_next_rounded),
                    label: const Text('Go to Fourth Page')),
              ],
            );
          },
        ),
      ),
    );
  }

  Route<Object?> _createRoute(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const ThirdPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return BlocProvider(
          create: (context) => ThirdPageBloc(),
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SlideTransition(
              position: animation.drive(tween),
              child: child,
            ),
          ),
        );
      },
    );
  }

  Route<Object?> _createRouteFourthPage(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const FourthPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => StoryCubit(),
            ),
            BlocProvider(
              create: (context) => FbBloc()
              ..add(LoadDataBloc()),
            ),
          ],
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SlideTransition(
              position: animation.drive(tween),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
