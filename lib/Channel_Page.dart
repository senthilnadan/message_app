import 'package:flutter/material.dart';
import 'package:message_app/meta/Channel.dart';
import 'package:message_app/meta/Message.dart';

import 'meta/ChannelMessagesBloc.dart';

class ChannelPage extends StatelessWidget {
  ChannelPage({Key? key, required this.channel}) : super(key: key);

  Channel channel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(channel.name)),
        body: ChannelDialog(channel: channel));
  }
}

class ChannelDialog extends StatefulWidget {
  ChannelDialog({super.key, required this.channel});

  Channel channel;

  @override
  State<ChannelDialog> createState() => _ChannelDialogState();
}

class _ChannelDialogState extends State<ChannelDialog> {
  final formKey = GlobalKey();
  final _inputTextController = TextEditingController();
  bool _channelInitialized = false;
  late ChannelMessagesBloc _channelMessagesBloc;

  @override
  void initState() {
    _channelMessagesBloc = ChannelMessagesBloc(widget.channel.id);
    _channelInitialized = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              width: 400,
              height: 600,
              child: StreamBuilder(
                stream: _channelMessagesBloc.channelMessagesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ChanneMessagesWidget(messages: snapshot.data!);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ))
        ],
      ),
    );
  }
}

class ChanneMessagesWidget extends StatelessWidget {
  ChanneMessagesWidget({super.key, required this.messages});
  List<Message> messages;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Text(messages[index].text);
        },
      ),
    );
  }
}
