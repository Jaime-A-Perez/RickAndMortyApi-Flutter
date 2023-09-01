import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_characters/characters_bloc.dart';
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/utils/utils.dart';
import 'package:rick_and_morty/view/widgets/card_character.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override 
  Widget build(BuildContext context) {
    final blocCharacter = context.watch<CharactersBloc>(); 
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    return GridView.builder(
      itemCount: blocCharacter.state.characterList?.length?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: width * 0.65),
      itemBuilder: (context, index) {
        return CardCharacter(
          name: blocCharacter.state.characterList![index].name,
          image: blocCharacter.state.characterList![index].image,
          status: blocCharacter.state.characterList![index].status,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Center()));
                    // builder: (BuildContext context) => CharacterInfo()));
          },
        );
      },
    );
  }
}