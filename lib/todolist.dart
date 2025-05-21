import 'package:chat_app/services/todoservices.dart';
import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  TextEditingController taskcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskcontroller,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.add, color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your task",
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        final text = taskcontroller.text.trim();
                        if (text.isNotEmpty) {
                          Todoservices.addtodo(task: text);
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
                const SizedBox(height: 10),
                Flexible(
                  child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: Todoservices.gettodo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasData) {
                        final todos = snapshot.data!;
                        if (todos.isEmpty) {
                          return const Text("No tasks yet.");
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            final todo = todos[index];
                            return ListTile(
                              title: Text(todo['todo'] ?? ''),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      final todoId = todo['id'];
                                      final editController =
                                          TextEditingController(
                                        text: todo['todo'] ?? '',
                                      );

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Edit your task"),
                                            content: TextField(
                                              controller: editController,
                                              decoration: const InputDecoration(
                                                hintText: "Edit todo",
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  final updatedText =
                                                      editController.text
                                                          .trim();
                                                  if (updatedText.isNotEmpty &&
                                                      todoId != null) {
                                                    Todoservices.updatetodo(
                                                      id: todoId,
                                                      text: updatedText,
                                                    );
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: const Text("Update"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      final todoId = todo['id'];
                                      if (todoId != null) {
                                        Todoservices.deletetodo(id: todoId);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text("Something went wrong!");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
