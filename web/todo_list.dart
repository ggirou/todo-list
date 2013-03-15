import 'dart:html';
import 'todo.dart';


String input = "";
List<Todo> todos = [new Todo('Test web components', false), new Todo('Make a new logo', true)];

void main() {
}

addTask() {
  print("input: $input");
  todos.add(new Todo(input, false));
  input = "";
}