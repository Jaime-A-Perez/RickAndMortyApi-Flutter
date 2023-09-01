part of 'episodes_bloc.dart';


class EpisodesState extends Equatable{
  final List<Episode>? episodesList;
  final Episode? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;
  final List<Character>? characterInEpisode;

  EpisodesState({this.episodesList, this.searchResult, this.queryParameters, this.isActiveSearch, this.characterInEpisode});
 
 

  EpisodesState copywith({
    List<Episode>? episodesList,
    Episode? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    List<Character>? characterInEpisode
  }) => EpisodesState(
    episodesList: episodesList ?? this.episodesList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch,
    characterInEpisode: characterInEpisode ?? this.characterInEpisode);
    
      @override
      List<Object?> get props => [episodesList, searchResult, queryParameters, isActiveSearch, characterInEpisode];
  
}
