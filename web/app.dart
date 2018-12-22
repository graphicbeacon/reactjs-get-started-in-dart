@JS()
library react_interop;

import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS()
external ReactInterface get React;

@JS()
external ReactDomInterface get ReactDOM;

@JS()
@anonymous
class ReactInterface {
  external CreateElementFn get createElement;
}

typedef CreateElementFn = Function(
  dynamic name,
  Object attrs,
  List children,
);

@JS()
@anonymous
class ReactDomInterface {
  external DomRenderFn get render;
}

typedef DomRenderFn = Function(
  dynamic element,
  Element context,
);

Object makeJsObject(Map dartMap) {
  var jsObject = newObject();

  for (var key in dartMap.keys) {
    setProperty(jsObject, key, dartMap[key]);
  }

  return jsObject;
}

@JS('createReactClass')
external _createReactClass(obj);

createReactClass(Map dartMap) => _createReactClass(makeJsObject(dartMap));

class ReactClassInterface {
  external get props;
}
