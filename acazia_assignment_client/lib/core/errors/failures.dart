import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{
  final String message;

  Failures({this.message = ''});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class ServerFailure extends Failures {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

class CacheFailure extends Failures{
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}