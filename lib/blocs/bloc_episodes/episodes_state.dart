part of 'episodes_bloc.dart';


class EpisodesState extends Equatable{
  final List<Episode>? episodesList;
  final Episode? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;
 
  const EpisodesState({this.episodesList, this.searchResult, this.queryParameters, this.isActiveSearch});

  EpisodesState copywith({
    List<Episode>? characterList,
    Episode? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
  }) => EpisodesState(
    episodesList: episodesList ?? this.episodesList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch) ;
    
      @override
      List<Object?> get props => [episodesList, searchResult, queryParameters, isActiveSearch];
  
}
