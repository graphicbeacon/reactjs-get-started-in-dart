import 'dart:html';

import 'interop/react.dart';
import 'components/hello_message.dart';
import 'components/ticker.dart';

void main() {
  ReactDOM.render(
      React.createElement(
        HelloMessage,
        makeJsObject({
          "name": "Taylor",
        }),
        null,
      ),
      querySelector('#output'));

  ReactDOM.render(
      React.createElement(
        Ticker,
        null,
        null,
      ),
      querySelector('#output2'));
}
