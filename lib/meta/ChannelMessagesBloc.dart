import 'dart:async';

import 'package:flutter/foundation.dart';

import 'Message.dart';

class ChannelMessagesBloc {
  late String _channelID;
  String get channelID => _channelID;
  ChannelMessagesBloc(this._channelID) {
    _channelMessagesStreamController
        .add(MessageRepo.getchannelMessages(channelID));
    _newChannelMessageController.stream.listen(_newMessageForChannel);
  }

  final _channelMessagesStreamController = StreamController<List<Message>>();
  final _newChannelMessageController = StreamController<Message>();
  final _updateChannelMessageController = StreamController<Message>();
  final _deleteChannelMessageController = StreamController<Message>();

  Stream<List<Message>> get channelMessagesStream =>
      _channelMessagesStreamController.stream;

  StreamSink<List<Message>> get channelMessagesSink =>
      _channelMessagesStreamController.sink;

  StreamSink<Message> get newMessageSink => _newChannelMessageController.sink;

  ChannelMessagesBloc.forChannel(String channelID) {
    this._channelID = channelID;
    _channelMessagesStreamController
        .add(MessageRepo.getchannelMessages(channelID));
    _newChannelMessageController.stream.listen(_newMessageForChannel);
  }

  _newMessageForChannel(Message message) {
    channelMessagesSink
        .add(MessageRepo.addMessageToChannel(message, _channelID)!);
  }
}

class MessageRepo {
  static final Map<String, List<Message>> channelMessagesMap = {
    "01": [Message("001", "hello people", "01")],
    "02": [Message("002", "hello people", "02")]
  };

  static List<Message> getchannelMessages(String channelID) =>
      channelMessagesMap.containsKey(channelID)
          ? channelMessagesMap[channelID]
          : init(channelID);

  static List<Message>? addMessageToChannel(Message message, String channelID) {
    List<Message> channelMessages;
    if (channelMessagesMap.containsKey(channelID)) {
      channelMessages = channelMessagesMap[channelID]!;
    } else {
      channelMessages = [];
    }
    channelMessagesMap[channelID] = [...channelMessages, message];
    return channelMessagesMap[channelID];
  }

  static init(String channelId) {
    channelMessagesMap.putIfAbsent(
        channelId, () => [Message("001", "hello people", channelId)]);
    return channelMessagesMap[channelId];
  }
}
