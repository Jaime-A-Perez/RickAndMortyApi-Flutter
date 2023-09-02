part of 'characters_bloc.dart';

class CharactersState extends Equatable{
  final List<Character>? characterList;
  final Character? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;
  final bool? isRequeringData;
  final int? currentPage;


  const CharactersState( {this.characterList, this.searchResult, this.queryParameters, this.isActiveSearch,this.isRequeringData = false, this.currentPage = 1});

  CharactersState copywith({
    List<Character>? characterList,
    Character? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    bool? isRequeringData,
    int? currentPage
  }) => CharactersState(
    characterList: characterList ?? this.characterList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch,
    isRequeringData: isRequeringData ?? this.isRequeringData,
    currentPage: currentPage ?? this.currentPage
    ) ;
    
  @override
  List<Object?> get props => [characterList, searchResult, queryParameters, isActiveSearch, isRequeringData, currentPage];  
}

