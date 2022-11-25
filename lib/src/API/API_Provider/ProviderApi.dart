import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class providerApi extends StatefulWidget {
  const providerApi({super.key});

  @override
  State<providerApi> createState() => _providerApiState();
}

class _providerApiState extends State<providerApi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider API')),
      body: Consumer<TodoProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final todos = value.todos;
        return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                  leading: CircleAvatar(child: Text(todo.id.toString())),
                  title: Text(
                    todo.title ?? '',
                    style: const TextStyle(
                      // color: ({todo.title ?? ''}  ? Colors.amber : Colors.black),
                    ),
                  ));
            });
      }),
    );
  }
}

class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todo({this.userId, this.id, this.title, required this.completed});

  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}

class TodoService {
  Future<List<Todo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
            userId: e['userId'],
            id: e['id'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return todos;
    }
    // throw "Something went wrong";
    return [];
  }
}

class TodoProvider extends ChangeNotifier {
  final _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
