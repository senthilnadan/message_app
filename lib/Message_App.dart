import 'package:flutter/material.dart';

import 'Channel_Page.dart';
import 'meta/Channel.dart';

import 'meta/MessageAppBlocProvider.dart';

class MessageApp extends StatelessWidget {
  const MessageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message App"),
      ),
      body: Container(
        child: ChannelListStreamWidget(),
      ),
    );
  }
}

class ChannelListStreamWidget extends StatelessWidget {
  const ChannelListStreamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MessageAppBlockProvider.of(context).channelListStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ChannelListWidget(channels: snapshot.data!);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class ChannelListWidget extends StatelessWidget {
  ChannelListWidget({Key? key, required this.channels}) : super(key: key);

  List<Channel> channels;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: channels.length,
        itemBuilder: (context, index) {
          return ChannelView(channel: channels[index]);
        },
      ),
    );
  }
}

class ChannelView extends StatelessWidget {
  ChannelView({Key? key, required this.channel}) : super(key: key);

  Channel channel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChannelPage(channel: channel)));
      },
      child: Card(
        child: Container(
          child: Text(channel.name),
        ),
      ),
    );
  }
}
