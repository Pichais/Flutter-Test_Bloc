import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_bloc.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_event.dart';
import 'package:flutter_applicationtest/view/fourth_page/fb_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventLikeCommentShere extends StatelessWidget {
 const EventLikeCommentShere({
    super.key,
    required this.fbmodel,
  });

  final FacebookModel fbmodel;

  @override
  Widget build(BuildContext context) {
    print("fbmodel.likepost ${fbmodel.likepost}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => context.read<FbBloc>().add(ClickLike(id: fbmodel.id)),
                child:  Icon(Icons.circle, color: fbmodel.likepost?
                 Colors.blue:null,)),
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
        Row(
          children: [
            GestureDetector(onTap: () {}, child: const Icon(Icons.circle)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text('แชร์'),
            ),
          ],
        ),
      ],
    );
  }
}
