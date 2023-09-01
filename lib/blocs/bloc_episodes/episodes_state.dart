part of 'episodes_bloc.dart';


class EpisodesState {
  final List<Episode>? characterList;
  final Episode? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;

  EpisodesState({this.characterList, this.searchResult, this.queryParameters, this.isActiveSearch});

  EpisodesState copywith({
    List<Episode>? characterList,
    Episode? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
  }) => EpisodesState(
    characterList: characterList ?? this.characterList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch) ;
  
}
