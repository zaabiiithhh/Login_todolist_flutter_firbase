import 'package:chat_app/services/todoservices.dart';
import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  TextEditingController taskcontroller = TextEditingController();
  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            padding: EdgeInsets.all(10),
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "To-do App",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskcontroller,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your task",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (taskcontroller.text.trim().isNotEmpty) {
                          Todoservices.addtodo(
                              task: taskcontroller.text.trim());
                          taskcontroller.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text("Add"),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                        stream: Todoservices.gettodo(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Map<String, dynamic>> todos = snapshot.data!;
                            return ListView.builder(
                                itemCount: todos.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(todos[index]['todo'] ?? ''),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            final todoId = todos[index]['id'];
                                            if (todoId == null)
                                              return; // extra safety
                                            final editController =
                                                TextEditingController(
                                                    text: todos[index]
                                                            ['todo'] ??
                                                        '');

                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text("Edit TODO"),
                                                  content: TextField(
                                                    controller: editController,
                                                    decoration: InputDecoration(
                                                        hintText: "Edit todo"),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        final updatedText =
                                                            editController.text
                                                                .trim();
                                                        if (updatedText
                                                            .isNotEmpty) {
                                                          Todoservices
                                                              .updatetodo(
                                                            id: todoId,
                                                            text: updatedText,
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      child: Text("Update"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Todoservices.deletetodo(
                                                  id: todos[index]['id']);
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return CircularProgressIndicator();
                          }
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
