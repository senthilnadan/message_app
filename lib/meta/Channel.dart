import 'package:equatable/equatable.dart';

class Channel extends Equatable {
  String _id;
  String _name;

  Channel(this._id, this._name);

  String get id => _id;
  String get name => _name;

  @override
  List<Object?> get props => [_id, _name];
}
