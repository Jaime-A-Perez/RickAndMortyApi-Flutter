import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_characters/characters_bloc.dart';
import 'package:rick_and_morty/infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';
import 'package:rick_and_morty/infrastructure/models/model_character.dart';
import 'package:rick_and_morty/view/widgets/image_error.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blocCharacter = context.watch<CharactersBloc>(); 
    // final data =  DataSourceImpRickAndMorty().getCharacter(1);
    return Scaffold(        
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: blocCharacter.state.characterList != null ? Center(child:
         ImageError()) :
        //  Text("DAta")) :
          Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: ()async{
              //   final data = await DataSourceImpRickAndMorty().response("character", {"queryParameter": ""}) as ModelCharacter;
              //   print(data.results![0].name);
              }, child: Text("button")),
              // Text(data.toString()),
            ],
          ),
        ),
      );
  }
}