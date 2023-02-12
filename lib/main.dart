import 'package:flutter/material.dart';
import 'package:message_app/meta/MessageAppBlocProvider.dart';

import 'Message_App.dart';

void main() {
  runApp(MessageAppBlockProvider(child: const MaterialApp(home: MessageApp())));
}
