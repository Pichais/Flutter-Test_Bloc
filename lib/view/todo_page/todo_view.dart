import 'package:flutter/material.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_bloc.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_event.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
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
                return Center(
                  child: Text('Error state => ${state.massegeErr}'),
                );
              } else {
                return TabBarView(
                  children: [
                    ListToDo(state: (state as ReadyState)),
                    CreateToDo(),
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
    if (state.todoList.isNotEmpty) {
      return ListView.builder(
          itemCount: state.todoList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                    padding:
                        const EdgeInsets.all(20.0), // Inner space to the child of the container
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      // borderRadius: BorderRadius.circular(20), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        // Add one or more stops here
                        colors: [
                          Colors.blue, // Start color
                          Colors.orange.shade100 // End color
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.todoList[index].titleName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24, // Font size
                              fontWeight: FontWeight.bold, // Font weight
                            ),
                          ),
                          Text(
                            state.todoList[index].detail,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24, // Font size
                              fontWeight: FontWeight.bold, // Font weight
                            ),
                          ),
                        ],
                      ),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: Checkbox(
                    hoverColor: Colors.amberAccent,
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            );
          });
    } else {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('List To Do Emty !'),
        ],
      );
    }
  }
}

class CreateToDo extends StatelessWidget {
  CreateToDo({super.key});

  final TextEditingController ttt = TextEditingController();
  final TextEditingController fff = TextEditingController();

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
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFileCustom(
              controller: ttt,
              tiltleHeard: 'TITLE :',
              titleTextFiled: '',
            ),
          ),
          TextFileCustom(
            controller: fff,
            maxLine: 5,
            tiltleHeard: 'DETAIL :',
            titleTextFiled: '',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              onPressed: () {
                context.read<TodoBloc>().add(SaveDataTodo(titlename: ttt.text, detail: fff.text));
                ttt.clear();
                fff.clear();
              },
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
    required this.controller,
  });

  final int? maxLine;
  final String tiltleHeard;
  final String titleTextFiled;
  final TextEditingController controller;

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
            controller: controller,
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
