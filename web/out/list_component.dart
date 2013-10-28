// Auto-generated from list-element.html.
// DO NOT EDIT.

library x_list;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'item_component.dart';
import 'package:web_ui/web_ui.dart';
import '../todo.dart';



class ListComponent extends WebComponent {
  /** Autogenerated from the template. */

  autogenerated.ScopedCssMapper _css;

  /** This field is deprecated, use getShadowRoot instead. */
  get _root => getShadowRoot("x-list");
  static final __html1 = new autogenerated.Element.html('<li is="x-item"></li>', treeSanitizer: autogenerated.nullTreeSanitizer), __shadowTemplate = new autogenerated.DocumentFragment.html('''
      <div>
        <span></span>
        <ul class="x-list">
          <template></template>
        </ul>
      </div>
    ''', treeSanitizer: autogenerated.nullTreeSanitizer);
  autogenerated.Element __e7;
  autogenerated.SpanElement __e5;
  autogenerated.Template __t;

  void created_autogenerated() {
    var __root = createShadowRoot("x-list");
    setScopedCss("x-list", new autogenerated.ScopedCssMapper({"x-list":"[is=\"x-list\"]"}));
    _css = getScopedCss("x-list");
    __t = new autogenerated.Template(__root);
    __root.nodes.add(__shadowTemplate.clone(true));
    __e5 = __root.nodes[1].nodes[1];
    var __binding3 = __t.contentBind(() => remaining(), false);
    var __binding4 = __t.contentBind(() => todos.length, false);
    __e5.nodes.addAll([__binding3,
        new autogenerated.Text(' of '),
        __binding4,
        new autogenerated.Text(' remaining')]);
    __e7 = __root.nodes[1].nodes[3].nodes[1];
    __t.loop(__e7, () => todos, ($list, $index, __t) {
      var todo = $list[$index];
      var __e6;
      __e6 = __html1.clone(true);
      __t.oneWayBind(() => todo, (e) { if (__e6.xtag.todo != e) __e6.xtag.todo = e; }, false, false);
      __t.component(new ItemComponent()..host = __e6);
    __t.addAll([new autogenerated.Text('\n            '),
        __e6,
        new autogenerated.Text('\n          ')]);
    });
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e5 = __e7 = null;
  }

  /** Original code from the component. */

  List<Todo> todos = [];

  remaining() {
    return todos.length - todos.where((e) => e.done).toList().length;
  }
}

//# sourceMappingURL=list_component.dart.map