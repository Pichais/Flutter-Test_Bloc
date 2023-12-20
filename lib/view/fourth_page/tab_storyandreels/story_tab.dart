

import 'package:equatable/equatable.dart';

enum StoryTab {story, reels}


final class TabState extends Equatable{
  final StoryTab tab;
const  TabState(
   { this.tab = StoryTab.story}
  );

  @override
  List<Object> get props => [tab];
}
