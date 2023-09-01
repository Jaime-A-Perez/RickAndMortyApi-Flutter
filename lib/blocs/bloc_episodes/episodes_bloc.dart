import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domine/entities/epidode.dart';
import 'package:rick_and_morty/infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesState()) {
    on<InitEpisodesBloc>((event, emit) async{
      final List<Episode> episodes = await DataSourceImpRickAndMorty().getEpisode(1);
      emit(state.copywith(episodesList: episodes));
    });
  }
}
