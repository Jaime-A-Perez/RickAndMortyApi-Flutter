import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_characters/characters_bloc.dart';
import 'package:rick_and_morty/utils/utils.dart';
import 'package:rick_and_morty/view/screens/detail_character_page.dart';
import 'package:rick_and_morty/view/widgets/card_character.dart';

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
        Positioned(
          bottom: width * 0.05,
          right:  width * 0.05,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Text("Next Page", 
                  style: TextStyle(color:  Color.fromARGB(191, 12, 255, 49), 
                    backgroundColor: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w600
                    ),)),
              FloatingActionButton(onPressed: (){}, child: Icon(Icons.next_plan_sharp)),
            ],
          )) :
           Center(),
      ],
    );
  }
}