import 'dart:async';

import 'Channel.dart';
import 'Message.dart';

class MessageAppBloc {
  // ignore: prefer_final_fields
  List<Channel> _channelList = [
    Channel("01", "My First Channel"),
    Channel("02", "All About Me Channel"),
    Channel("02", "All About Me City"),
  ];

  final _channelListStreamController = StreamController<List<Channel>>();
  final _newChannelStreamController = StreamController<Channel>();
  final _updateChannelStreamController = StreamController<Channel>();
  final _deleteChannelStreamController = StreamController<Channel>();

  get channemMessagesStream => null;

  StreamSink<List<Channel>> get channelListStreamSink =>
      _channelListStreamController.sink;

  Stream<List<Channel>> get channelListStream =>
      _channelListStreamController.stream;

  StreamSink<Channel> get newChannelSink => _newChannelStreamController.sink;
  StreamSink<Channel> get updateChannelSink =>
      _updateChannelStreamController.sink;
  StreamSink<Channel> get deleteChannelSink =>
      _deleteChannelStreamController.sink;

  Stream<Channel> get newChannelStream => _newChannelStreamController.stream;

  Stream<Channel> get updateChannelStream =>
      _updateChannelStreamController.stream;
  Stream<Channel> get deleteChannelStream =>
      _deleteChannelStreamController.stream;

  MessageAppBloc() {
    _channelListStreamController.add(_channelList);
    _newChannelStreamController.stream.listen(_newChannel);
  }

  _newChannel(Channel channel) {
    _channelList = [..._channelList, channel];
  }
}
