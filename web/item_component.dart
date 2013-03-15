import 'package:web_ui/web_ui.dart';
import 'todo.dart';

class ItemComponent extends WebComponent {
  Todo todo;

  void onTaskDone() {
    print("Task done: ${todo.done}");
  }
}
