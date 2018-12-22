import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'app.dart';

void main() {
  var context = querySelector('#output');
  ReactDOM.render(
      React.createElement(
        Greeting,
        makeJsObject({
          "name": "John",
        }),
        ['Your Dart app is running.'],
      ),
      context);
}

var Greeting = createReactClass({
  "render": allowInteropCaptureThis(
    (ReactClassInterface self) => React.createElement(
          'h1',
          null,
          ['Hello, ${getProperty(self.props, 'name')}'],
        ),
  )
});
