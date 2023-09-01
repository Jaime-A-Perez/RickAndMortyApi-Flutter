part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesEvent {}
class InitEpisodesBloc extends EpisodesEvent {
  InitEpisodesBloc();
}

class AddNewItems extends EpisodesEvent {
  AddNewItems();
}

class SearchEvent extends EpisodesEvent {
  
}