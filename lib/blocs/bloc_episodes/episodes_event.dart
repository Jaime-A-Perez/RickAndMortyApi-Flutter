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

class AddCharacterOfEpisodeEvent extends EpisodesEvent {
  final List<String> listCharactersOfEpisode;

  AddCharacterOfEpisodeEvent(this.listCharactersOfEpisode);
}

class AddNextPageOfEpisodesBloc extends EpisodesEvent {
 final int currentPage;

  AddNextPageOfEpisodesBloc(this.currentPage);
}

class IsRequeringData extends EpisodesEvent {
  final bool isRequeringData;

  IsRequeringData(this.isRequeringData);
}