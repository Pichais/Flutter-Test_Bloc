import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/view/fourth_page/tab_storyandreels/story_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tab_storyandreels/story_cubit.dart';

class StoryandReels extends StatelessWidget {
  const StoryandReels({
    super.key,
    required this.selectedTab,
    required this.w,
    required this.h,
  });

  final StoryTab selectedTab;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => context.read<StoryCubit>().setTab(StoryTab.story),
                    child: Text('สตอรี่',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedTab == StoryTab.story ? Colors.blue : null,
                        )),
                  ),
                  GestureDetector(
                    onTap: () => context.read<StoryCubit>().setTab(StoryTab.reels),
                    child: Text('Reels',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedTab == StoryTab.reels ? Colors.blue : null,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: Container(
                    height: 2,
                    color: selectedTab == StoryTab.story ? Colors.blue : null,
                  )),
                  Expanded(
                      child: Container(
                    height: 2,
                    color: selectedTab == StoryTab.reels ? Colors.blue : null,
                  )),
                ],
              ),
            ],
          ),
        ),
        StoryAndReelsPost(w: w, h: h, groupValue: selectedTab),
      ],
    );
  }
}

class StoryAndReelsPost extends StatelessWidget {
  const StoryAndReelsPost({
    super.key,
    required this.w,
    required this.h,
    required this.groupValue,
  });

  final double w;
  final double h;
  final StoryTab groupValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h * 0.2,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 5),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.only(right: 5, bottom: 10),
              width: w * 0.23,
              child: Stack(
                children: [
                  Container(
                    height: h,
                    width: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: groupValue == StoryTab.story ? Colors.blue : Colors.red.shade400),
                  ),
                  groupValue == StoryTab.story
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.circle,
                            size: 25,
                          ),
                        )
                      : Container()
                ],
              ));
        },
      ),
    );
  }
}
