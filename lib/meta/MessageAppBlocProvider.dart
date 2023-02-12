import 'package:message_app/meta/MessageAppBloc.dart';

import 'package:flutter/material.dart';

class MessageAppBlockProvider extends InheritedWidget {
  final MessageAppBloc bloc = MessageAppBloc();

  MessageAppBlockProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MessageAppBloc of(BuildContext context) {
    return (context
                .dependOnInheritedWidgetOfExactType<MessageAppBlockProvider>()
            as MessageAppBlockProvider)
        .bloc;
  }
}
