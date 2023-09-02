import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_characters/characters_bloc.dart';
import 'package:rick_and_morty/utils/utils.dart';
import 'package:rick_and_morty/view/screens/detail_character_page.dart';
import 'package:rick_and_morty/view/widgets/card_character.dart';
import 'package:rick_and_morty/view/widgets/pagination_controls.dart';

class CharacterPage extends StatefulWidget {
  CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    loadNewData();
    super.initState();
  }

  void loadNewData(){
    scrollController.addListener(() {
        if (scrollController.position.pixels + 300 >= 
        scrollController.position.maxScrollExtent &&
        scrollController.position.pixels  <= 
        scrollController.position.maxScrollExtent
        ){
         final bloc = context.read<CharactersBloc>();
         bloc.add(IsRequeringData(true));
        }
       });
  }

  @override 
  Widget build(BuildContext context) {
    final blocCharacter = context.watch<CharactersBloc>(); 
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    return Stack(
      children: [
        GridView.builder(
          controller: scrollController,
          itemCount: blocCharacter.state.characterList?.length?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: width * 0.65),
          itemBuilder: (context, index) {
            return CardCharacter(
              character: blocCharacter.state.characterList![index],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DetailCharacter(character: blocCharacter.state.characterList![index],)));
              },
            );
          },
        ),
        blocCharacter.state.isRequeringData! ?          
          PaginatonControls(onPressed:  ()async{
                final blocCharacterRead = context.read<CharactersBloc>();
                blocCharacterRead.add(AddNextPageOfCharactersBloc(blocCharacterRead.state.currentPage! + 1));
                await Future.delayed(const Duration(milliseconds: 600),(){
                  scrollController.jumpTo(scrollController.position.pixels + 80);
                blocCharacterRead.add(IsRequeringData(false));
                });
              }):
           Center(),
      ],
    );
  }
}