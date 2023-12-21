import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_bloc.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_event.dart';
import 'package:flutter_applicationtest/DB/fb_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventLikeCommentShere extends StatelessWidget {
  const EventLikeCommentShere({
    super.key,
    required this.fbmodel,
  });

  final FacebookModel fbmodel;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => context.read<FbBloc>().add(ClickLike(id: fbmodel.id)),
                child: Icon(
                  Icons.circle,
                  color: fbmodel.likepost ? Colors.blue : null,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text('ถูกใจ'),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(onTap: () {}, child: const Icon(Icons.circle)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text('แสดงความคิดเห็น'),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Sherebuttom(h: h, w: w);
              },
            );
          },
          child: const Row(
            children: [
              Icon(Icons.circle),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text('แชร์'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Sherebuttom extends StatelessWidget {
  const Sherebuttom({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.65,
      width: w,
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(1), topRight: Radius.circular(1))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            width: w,
            height: h * 0.2,
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius:
                    BorderRadius.all(Radius.circular(10))),
          )
        ],
      ),
    );
  }
}
