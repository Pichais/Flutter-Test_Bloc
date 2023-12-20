// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_bloc.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_state.dart';
import 'package:flutter_applicationtest/view/fourth_page/tab_storyandreels/story_cubit.dart';
import 'package:flutter_applicationtest/view/fourth_page/widget/hearder_post.dart';
import 'package:flutter_applicationtest/view/fourth_page/widget/like_comment_shere.dart';
import 'package:flutter_applicationtest/view/fourth_page/widget/story_and_reels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final selectedTab = context.select((StoryCubit cubit) => cubit.state.tab);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Facebook',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.add_circle_outline_rounded, size: 30),
          SizedBox(width: 10),
          Icon(Icons.search_rounded, size: 30),
          SizedBox(width: 10),
          Icon(Icons.account_circle_rounded, size: 30),
          SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<FbBloc, FbStateBloc>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Container();
          }
          var data = (state as ReadyState).facebookModel;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.circle, size: 50),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: InkWell(
                          onTap: () {},
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('คุณกำลังคิดอะไรอยู่'),
                            ],
                          ),
                        ),
                      )),
                      const Icon(Icons.image, color: Colors.green, size: 30)
                    ],
                  ),
                ),
                linearLine(),
                StoryandReels(selectedTab: selectedTab, w: w, h: h),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        linearLine(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HearderPost(facebookmodel: data[index]),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: ReadMoreText(
                                  data[index].detailPost,
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  colorClickableText: Colors.grey,
                                  trimCollapsedText: 'ดูเพิ่มเติม',
                                ),
                              ),
                              data[index].imageType
                                  ? Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Image.asset(data[index].image),
                                    )
                                  : Container(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                       Icon(
                                        Icons.circle,
                                        color: data[index].likepost? Colors.blue:null,
                                      ),
                                      Text('${data[index].totalLike}'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      data[index].totalComment > 0
                                          ? Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                              child:
                                                  Text('${data[index].totalComment} ความคิดเห็น'),
                                            )
                                          : Container(),
                                      data[index].totalShere > 0
                                          ? Text('แชร์ ${data[index].totalShere} ครั้ง')
                                          : Container(),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: linearLine(width: w * 0.9, height: 0.5),
                              ),
                               EventLikeCommentShere(fbmodel: data[index])
                            ],
                          ),
                        ),
                        linearLine(height: 0.5),
                      ],
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container linearLine({double? width, Color? color, double? height}) {
    return Container(
      height: height ?? 5,
      width: width ?? double.infinity,
      color: color ?? Colors.grey,
    );
  }
}
