
import 'package:flutter_applicationtest/view/fourth_page/tab_storyandreels/story_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryCubit extends Cubit<TabState>{
  StoryCubit():super(TabState());
  
  void setTab(StoryTab tab) => emit(TabState(tab: tab));
}