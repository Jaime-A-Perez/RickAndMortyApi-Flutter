part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesEvent {}
class InitCharacterBloc extends EpisodesEvent {
  InitCharacterBloc();
}

class AddNewItems extends EpisodesEvent {
  AddNewItems();
}

class SearchEvent extends EpisodesEvent {
  
}