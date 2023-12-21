import 'dart:async';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_event.dart';
import 'package:flutter_applicationtest/view/fourth_page/bloc/fb_state.dart';
import 'package:flutter_applicationtest/DB/fb_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FbBloc extends Bloc<FbEventBloc, FbStateBloc> {
  FbBloc() : super(InitialState()) {
    on<LoadDataBloc>(onLoadData);
    on<ClickLike>(onLikePost);
  }

  FutureOr<void> onLoadData(LoadDataBloc event, Emitter<FbStateBloc> emit) {
    List<FacebookModel> facebookModels = loadingData;

    emit(ReadyState(facebookModel: facebookModels));
  }

  List<FacebookModel> get loadingData {
    return [
      FacebookModel(
        id: 1,
        titlename: 'แมวน้อย กรอยใจ',
        postWhen: '5 ชม',
        detailPost: 'คงมีแต่พระที่ต้องการฉัน',
        image: 'assets/1.png',
        totalLike: 228,
        totalComment: 12,
        totalShere: 12,
        imageType: true,
        likepost: false,
      ),
      FacebookModel(
        id: 2,
        titlename: 'หนูหิ่น อินเตอร์',
        postWhen: '6 ชม',
        detailPost: 'จริง ๆ พร้อมบวกตลอดเลยนะ เพราะเรียนเลขมา',
        image: '',
        totalLike: 12,
        totalComment: 16,
        totalShere: 0,
        imageType: false,
        likepost: false,
      ),
      FacebookModel(
        id: 3,
        titlename: 'สามโบก ซาว',
        postWhen: '12 นาที',
        detailPost: 'ถ้าเขาจะรัก ยืนเฉย ๆ เขาก็รัก สรุปแล้วยืนจนเป็นเส้นเลือดขอด',
        image: 'assets/7.png',
        totalLike: 171,
        totalComment: 22,
        totalShere: 1,
        imageType: false,
        likepost: false,
      ),
      FacebookModel(
        id: 4,
        titlename: 'พอจง พอจาย',
        postWhen: '3 วัน',
        detailPost: 'คนเก่งมีมาก แต่คนที่หายากนั้นคือคนหาย',
        image: '',
        totalLike: 57,
        totalComment: 10,
        totalShere: 1,
        imageType: false,
        likepost: false,
      ),
      FacebookModel(
        id: 5,
        titlename: 'อีกี้ เป็นสะก๊อย',
        postWhen: '4 นาที',
        detailPost: 'เบื่อแล้วน้ำพริกลงเรือ อยากดื่มน้ำเกลือโรงพยาบาล',
        image: '',
        totalLike: 330,
        totalComment: 128,
        totalShere: 33,
        imageType: false,
        likepost: false,
      ),
      FacebookModel(
        id: 6,
        titlename: 'บุ๊ค แวนซ์',
        postWhen: '3 ชม',
        detailPost: 'เงินจะกินข้าวยังไม่มี แต่สั่งของออนไลน์ทีเหมือนบ้านเป็นเศรษฐีน้ำมัน',
        image: 'assets/3.png',
        totalLike: 99,
        totalComment: 30,
        totalShere: 2,
        imageType: true,
        likepost: false,
      ),
      FacebookModel(
        id: 7,
        titlename: 'ทอนาโด ตอปีโด',
        postWhen: '3 ชม',
        detailPost: 'ถึงหัวใจจะอ่อนแอ แต่ตับเราแข็งนะ',
        image: 'assets/4.png',
        totalLike: 2,
        totalComment: 0,
        totalShere: 0,
        imageType: true,
        likepost: false,
      ),
    ];
  }

  FutureOr<void> onLikePost(ClickLike event, Emitter<FbStateBloc> emit) {
    final currentState = (state as ReadyState);
    List<FacebookModel> updatelist = [];


    for (FacebookModel element in currentState.facebookModel) {
      if (element.id == event.id) {
        // element.likepost = true;
        bool updatelike = !element.likepost;
        int updatetotallike = updatelike? element.totalLike +1 :  element.totalLike -1;
        updatelist.add(element.copyWith(likepost: updatelike, totalLike: updatetotallike));
      } else {
        updatelist.add(element);
      }
    }

     

    emit(ReadyState(facebookModel: updatelist));
  }
}
