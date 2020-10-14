part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PersonWaitingState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Person> people;
  final List<Person> favoritePeople;

  HomeSuccessState(this.people, this.favoritePeople);

  HomeSuccessState copyWith({
    List<Person> people,
    List<Person> favoritePeople
  }) {
    return HomeSuccessState(
      people ?? this.people,
      favoritePeople ?? this.favoritePeople,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [this.favoritePeople, this.people];
}

class HomeFailureState extends HomeState {}
