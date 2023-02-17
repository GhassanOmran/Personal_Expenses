// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class TodoModel extends ChangeNotifier {
//   List<Todo> _todos = [];

//   List<Todo> get todos => _todos;

//   void add(Todo todo) {
//     _todos.add(todo);
//     notifyListeners();
//   }

//   void remove(Todo todo) {
//     _todos.remove(todo);
//     notifyListeners();
//   }
// }

// class SettingsModel extends ChangeNotifier {
//   bool _darkMode = false;

//   bool get darkMode => _darkMode;

//   void toggleDarkMode() {
//     _darkMode = !_darkMode;
//     notifyListeners();
//   }
// }

// class TodoController {
//   final TodoModel model = TodoModel();

//   void add(Todo todo) {
//     model.add(todo);
//   }

//   void remove(Todo todo) {
//     model.remove(todo);
//   }
// }

// class SettingsController {
//   final SettingsModel model = SettingsModel();

//   void toggleDarkMode() {
//     model.toggleDarkMode();
//   }
// }

// class Todo {
//   String text;
//   bool completed;

//   Todo({
//     required this.text,
//     this.completed = false,
//   });
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<TodoModel>(create: (context) => TodoController().model),
//         ChangeNotifierProvider<SettingsModel>(create: (context) => SettingsController().model),
//       ],
//       child: MaterialApp(
//         title: 'My App',
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     TodoModel todoModel = Provider.of<TodoModel>(context);
//     SettingsModel settingsModel = Provider.of<SettingsModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//       ),
//       body: Column(
//         children: [
//           Text('Dark Mode: ${settingsModel.darkMode}'),
//           ElevatedButton(
//             onPressed: () {
//               SettingsController().toggleDarkMode();
//             },
//             child: Text('Toggle Dark Mode'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: todoModel.todos.length,
//               itemBuilder: (context, index) {
//                 Todo todo = todoModel.todos[index];
//                 return CheckboxListTile(
//                   value: todo.completed,
//                   onChanged: (value) {
//                     todo.completed = value!;
//                     todoModel.notifyListeners();
//                   },
//                   title: Text(todo.text),
//                 );
//               },
//             ),
//           ),
//           TextField(
//             onSubmitted: (value) {
//               todoModel.add(Todo(text: value));
//             },
//             decoration: InputDecoration(
//               labelText: 'Add a new task',
//               contentPadding: EdgeInsets.all(16.0),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
