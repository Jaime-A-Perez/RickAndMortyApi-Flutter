import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  

  CharactersBloc() : super(CharactersState()) {
    on<InitCharacterBloc>((event, emit) async{
      final List<Character> characters = await DataSourceImpRickAndMorty().getCharacter(1);
      emit(state.copywith(characterList: characters));
    });

    on<AddNextPageOfCharactersBloc>((event, emit) async{
      final List<Character> characters = await DataSourceImpRickAndMorty().getCharacter(event.currentPage);
      emit(state.copywith(characterList: [...state.characterList!, ...characters], currentPage: event.currentPage));
    });
    
    on<IsRequeringData>((event, emit) async{                
      emit(state.copywith(isRequeringData: event.isRequeringData));
    });
  }
}
