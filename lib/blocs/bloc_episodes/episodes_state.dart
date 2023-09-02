part of 'episodes_bloc.dart';


class EpisodesState extends Equatable{
  final List<Episode>? episodesList;
  final Episode? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;
  final List<Character>? characterInEpisode;
  final bool? isRequeringData;
  final int? currentPage;

  const EpisodesState({this.episodesList, this.searchResult, this.queryParameters, this.isActiveSearch, this.characterInEpisode, this.isRequeringData = false, this.currentPage = 1});
 
 

  EpisodesState copywith({
    List<Episode>? episodesList,
    Episode? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    List<Character>? characterInEpisode,
    bool? isRequeringData,
    int? currentPage
  }) => EpisodesState(
    episodesList: episodesList ?? this.episodesList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch,
    characterInEpisode: characterInEpisode ?? this.characterInEpisode,
    isRequeringData: isRequeringData ?? this.isRequeringData,
    currentPage: currentPage ?? this.currentPage
    ) ;
    
      @override
      List<Object?> get props => [episodesList, searchResult, queryParameters, isActiveSearch, characterInEpisode,isRequeringData, currentPage];  
  
}
