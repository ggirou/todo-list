import 'package:web_ui/web_ui.dart';
import 'todo.dart';

class ListComponent extends WebComponent {
  List<Todo> todos = [];

  remaining() {
    return todos.length - todos.where((e) => e.done).toList().length;
  }
}
