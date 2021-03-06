part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {

}

class GetAllPersonsEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class NextPersonOnPressEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class DismissPersonOnPressEvent extends HomeEvent {
  final Person person;

  DismissPersonOnPressEvent(this.person);

  @override
  // TODO: implement props
  List<Object> get props => [person];

}

class SavePersonOnPressEvent extends HomeEvent {
  final Person person;

  SavePersonOnPressEvent(this.person);
  @override
  // TODO: implement props
  List<Object> get props => [this.person];

}