import 'dart:async';

import 'package:flutter_applicationtest/view/third_page/bloc/third_event.dart';
import 'package:flutter_applicationtest/view/third_page/bloc/third_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ThirdPageBloc extends Bloc<ThirdPageEvent, ThirdPageState> {
  ThirdPageBloc() : super(const ThirdPageState()) {
    on<ThirdPageName>(_onChangeName);
    on<ThirdPageAge>(_onChangeAge);
    on<ThirdPageOnSubmit>(_onSubmit);
  }

  FutureOr<void> _onChangeName(ThirdPageName event, Emitter<ThirdPageState> emit) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _onChangeAge(ThirdPageAge event, Emitter<ThirdPageState> emit) {
    emit(state.copyWith(age: event.age));
  }

  FutureOr<void> _onSubmit(ThirdPageOnSubmit event, Emitter<ThirdPageState> emit) async {
    print("${state.name} && ${state.age}");
    // เตรียม URL ที่มี query parameters
    String baseUrl = 'script.google.com';
    String path =
        '/macros/s/AKfycbyJMDaepjoGoza2HSIxNKppSBV3mpIRC4IOCaonWZK1erqcDdUT4KFjx1WvOkVfjU3C/exec';
    var params = {
      'name': state.name,
      'age': state.age.toString(), // ต้องการแปลง age เป็น String หากมันเป็นตัวเลข
    };
    var uri = Uri.https(baseUrl, path, params);

// ทำการ HTTP GET request
    try {
      var response = await http.get(uri);

      print(response.statusCode);
       print(response.reasonPhrase);
        print(response.request?.url);
    } catch (e) {
      print(e);
    }
  }
}
