import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/DB/fb_model.dart';

class HearderPost extends StatelessWidget {
 const  HearderPost({
    super.key,
    required this.facebookmodel
  });

 final FacebookModel facebookmodel;
  

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.circle, size: 50),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(facebookmodel.titlename),
                const Row(
                  children: [
                    Icon(Icons.more_horiz),
                    Icon(Icons.close),
                  ],
                ),
              ],
            ),
             Row(
              children: [
                Text(facebookmodel.postWhen),
               const Icon(
                  Icons.circle,
                  size: 17,
                )
              ],
            )
          ],
        )),
      ],
    );
  }
}