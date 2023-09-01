part of 'episodes_bloc.dart';


class EpisodesState {
  final List<Episode>? episodesList;
  final Episode? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;
 
  EpisodesState({this.episodesList, this.searchResult, this.queryParameters, this.isActiveSearch});

  EpisodesState copywith({
    List<Episode>? characterList,
    Episode? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
  }) => EpisodesState(
    episodesList: characterList ?? this.episodesList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch) ;
  
}
