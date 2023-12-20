import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/view/third_page/bloc/third_bloc.dart';
import 'package:flutter_applicationtest/view/third_page/bloc/third_event.dart';
import 'package:flutter_applicationtest/view/third_page/bloc/third_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page '),
      ),
      body: BlocBuilder<ThirdPageBloc, ThirdPageState>(
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name : ${state.name}'),
                 Text('Age :  ${state.age}'),
                 
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    onChanged: (value) => context.read<ThirdPageBloc>().add(ThirdPageName(name: value)),
                  )),
               SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => context.read<ThirdPageBloc>().add(ThirdPageAge(age: value)),
                  )),
                 const  SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                context.read<ThirdPageBloc>().add(ThirdPageOnSubmit());
              }, child: const Text('Submit'))
              ],
            ),
          );
        },
      ),
    );
  }
}
