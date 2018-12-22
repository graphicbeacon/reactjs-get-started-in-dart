import 'dart:async';
import 'package:js/js_util.dart';

import '../interop/react.dart';

var Ticker = createReactClass(
    getInitialState: () => makeJsObject({
          "seconds": 0,
        }),
    componentDidMount: (ReactClassInterface self) {
      self.interval = Timer.periodic(Duration(seconds: 1), (_) => self.tick());
    },
    componentWillUnmount: (ReactClassInterface self) {
      self.interval.cancel();
    },
    render: (ReactClassInterface self) => React.createElement(
          'div',
          null,
          ['Seconds ${getProperty(self.state, "seconds")}'],
        ),
    methodMap: {
      "tick": (ReactClassInterface self) {
        self.setState((dynamic state) {
          var seconds = getProperty(state, "seconds") as int;
          return makeJsObject({
            "seconds": seconds + 1,
          });
        });
      }
    });
