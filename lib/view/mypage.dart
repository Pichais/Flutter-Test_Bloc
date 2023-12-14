import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_applicationtest/bloc/bloc_bloc.dart';
import 'package:flutter_applicationtest/bloc/bloc_event.dart';
import 'package:flutter_applicationtest/view/second_page/second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_state.dart';
part 'widget/widget_cart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<Blocs>().add(loadDataBloc());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Blocs, BlocState>(builder: (context, state) {
      if (state is BlocLoading) {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else if (state is BlocFinish) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Shopping AppDemo'),
            actions: <Widget>[
              _shoppingCartBadge(state),
              IconButton(
                onPressed: () {
                  
                  Navigator.of(context).push(_createRoute());
                },
                icon: const Icon(Icons.arrow_forward),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return CartShopping(
                            id: state.categories[index].id,
                            picture: state.categories[index].imageUrl,
                            nameCard: state.categories[index].productName,
                            price: state.categories[index].price.toString(),
                            quantity: '${state.categories[index].quantity}',
                            index: index,
                          );
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      child: const Text('Go to Page 2'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Route _createRoute() {
    context.read<Blocs>().add(loadDataBloc());
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SecondPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget _shoppingCartBadge(BlocFinish stat) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -5, end: 3),
      badgeAnimation: const badges.BadgeAnimation.slide(
        disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        curve: Curves.easeInCubic,
      ),
      showBadge: stat.countCart > 0,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.red,
      ),
      badgeContent: Text(
        stat.countCart.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }
}
