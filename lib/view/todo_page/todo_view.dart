import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_bloc.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_event.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 400),
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'To Do App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.view_list_rounded)),
                Tab(icon: Icon(Icons.create_rounded)),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_forever_rounded),
              )
            ],
          ),
          body: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is InitailState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorState) {
                return const Center(
                  child: Text('Error state '),
                );
              } else {
                return  TabBarView(
                  children: [
                    ListToDo(state: (state as ReadyState)),
                   const CreateToDo(),
                  ],
                );
              }
            },
          )),
    );
  }
}

class ListToDo extends StatelessWidget {
  final ReadyState state;
  const ListToDo({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${state.tilename}'),
        Text('List To Do Emty !'),
        Text('List To Do Emty !'),
      ],
    );
  }
}

class CreateToDo extends StatelessWidget {
  const CreateToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'What do you want to do ?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextFileCustom(
              onChanged: (value) => context.read<TodoBloc>().add(SaveTitle(titlename: value)),
              tiltleHeard: 'TITLE :',
              titleTextFiled: '',
            ),
          ),
          TextFileCustom(
            onChanged: (value) => context.read<TodoBloc>().add(SaveDetail(detail: value)),
            maxLine: 5,
            tiltleHeard: 'DETAIL :',
            titleTextFiled: '',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              onPressed: () => context.read<TodoBloc>().add(SaveDataTodo()),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.save),
                  Text('Create'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFileCustom extends StatelessWidget {
  const TextFileCustom({
    super.key,
    this.maxLine,
    required this.tiltleHeard,
    required this.titleTextFiled,
    required this.onChanged,
  });

  final int? maxLine;
  final String tiltleHeard;
  final String titleTextFiled;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            tiltleHeard,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          ),
          child: TextFormField(
            onChanged: onChanged,
            cursorColor: Colors.black,
            maxLines: maxLine,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
              hintText: titleTextFiled,
            ),
          ),
        ),
      ],
    );
  }
}
