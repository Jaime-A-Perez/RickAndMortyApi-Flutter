import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/domine/entities/epidode.dart';
import 'package:rick_and_morty/infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';
import 'package:rick_and_morty/utils/utils.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(const EpisodesState()) {
    on<InitEpisodesBloc>((event, emit) async{
      final List<Episode> episodes = await DataSourceImpRickAndMorty().getEpisode(1);
      emit(state.copywith(episodesList: episodes));
    });
    
    on<AddCharacterOfEpisodeEvent>((event, emit) async{
      final List<int> listIdResidents = extractIdsFromUrls(event.listCharactersOfEpisode);
      final List<Character> characterInEpisode = await DataSourceImpRickAndMorty().getResidents(listIdResidents);
      emit(state.copywith(characterInEpisode: characterInEpisode));
    });

    on<AddNextPageOfEpisodesBloc>((event, emit) async{
      final List<Episode> episode = await DataSourceImpRickAndMorty().getEpisode(event.currentPage);
      emit(state.copywith(episodesList: [...state.episodesList!, ...episode], currentPage: event.currentPage));
    });
    
    on<IsRequeringData>((event, emit) async{                
      emit(state.copywith(isRequeringData: event.isRequeringData));
    });
  }
}
