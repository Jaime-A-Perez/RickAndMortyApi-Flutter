import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_bottom_bar/bottom_bar_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_characters/characters_bloc.dart';
import 'package:rick_and_morty/infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';
import 'package:rick_and_morty/infrastructure/models/model_character.dart';
import 'package:rick_and_morty/view/screens/characters_page.dart';
import 'package:rick_and_morty/view/screens/episodes_screen.dart';
import 'package:rick_and_morty/view/screens/locations_page.dart';
import 'package:rick_and_morty/view/widgets/image_error.dart';
import 'package:rick_and_morty/view/widgets/tab_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blocCharacter = context.watch<CharactersBloc>(); 
    final blocBottomBar = context.watch<BottomBarBloc>(); 
    final updateBottomBar = context.read<BottomBarBloc>();
    final namePage = ["Characters", "Locations", "Episodes"];
    final iconPage = [ Icon(Icons.person), Icon(Icons.fmd_good_sharp), Icon(Icons.movie)];
    final onTap = [(){updateBottomBar.add(ChangeIndex(0));},
                    (){updateBottomBar.add(ChangeIndex(1));},
                    (){updateBottomBar.add(ChangeIndex(2));}];
    final page = [CharacterPage(), LocationsPage(), EpisodesPage()];
    // final data =  DataSourceImpRickAndMorty().getCharacter(1);
    return 
    Scaffold(        
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: blocCharacter.state.characterList != null ?
         page[blocBottomBar.state.pageIndex]:
         ImageError(),
        bottomNavigationBar: 
        CustomBottomNavigationBar(
          titles: namePage,
          icons: iconPage,         
          ontaps: onTap),
      );
  }
}