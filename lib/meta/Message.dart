import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Message extends Equatable {
  String _id;
  String _channelID;
  String _text;

  Message(this._id, this._text, this._channelID);

  String get id => _id;
  String get text => _text;
  String get channelID => _channelID;

  @override
  List<Object?> get props => [_id, _text, channelID];
}
