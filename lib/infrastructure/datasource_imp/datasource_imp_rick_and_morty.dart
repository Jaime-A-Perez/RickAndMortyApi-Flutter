import 'package:rick_and_morty/domine/datasources/datasource_rick_and_morty.dart';
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/domine/entities/epidode.dart';
import 'package:rick_and_morty/infrastructure/mapper/mapper_character.dart';
import 'package:rick_and_morty/infrastructure/mapper/mapper_episode.dart';
import 'package:rick_and_morty/infrastructure/mapper/mapper_location.dart';
import 'package:rick_and_morty/infrastructure/models/model_character.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/infrastructure/models/model_episode.dart';
import 'package:rick_and_morty/infrastructure/models/model_location.dart';

import '../../domine/entities/location.dart';

class DataSourceImpRickAndMorty extends DataSourceRickAndMorty {

  Future<dynamic> _response( String typeRequest, Map<String,String> queryParameter) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'rickandmortyapi.com',
      path: '/api/$typeRequest',
      queryParameters: queryParameter 
    );

    final response = await http.get(uri);

    if (response.statusCode < 200 || response.statusCode > 299) {
        throw Exception("Error code: ${response.statusCode}");
      }  

      switch (typeRequest) {
        case "character":
         final ModelCharacter model = modelCharacterFromJson(response.body);
         return model;
         case "location":
         final ModelLocation model = modelLocationFromJson(response.body);
         return model;
         case "episode":
         final ModelEpisode model = modelEpisodeFromJson(response.body);
         return model;
         default:
         final String preResponse = '{"results": ${response.body}}';
         final ModelCharacter model = modelCharacterFromJson(preResponse);
         return model;
      }  
  }

  @override
  Future<List<Character>> getCharacter(int page) async{
    // Query and data modeling
    final ModelCharacter dataCharacter = await DataSourceImpRickAndMorty()._response("character", {"page": "$page"}) as ModelCharacter;
    // Mapping of the result to the entity
    final List<Character> characters = dataCharacter.results!.map((ResultCharacter e) => MapperCharacter.characterModelToCharacterEntity(e)).toList();
    // retunr list of entities Characters
    return characters;
  }

  @override
  Future<List<Episode>> getEpisode(int page) async{
    final ModelEpisode dataEpisode = await    DataSourceImpRickAndMorty()._response("episode", {"page": "$page"});

    final List<Episode> episodes = dataEpisode.results!.map((ResultEpisode e) => MapperEpisode.episodeModelToEpisodeEntity(e)).toList();

    return episodes; 
  }

  @override
  Future<List<Location>> getLocation(int page) async{
    final ModelLocation dataLocation = await DataSourceImpRickAndMorty()._response("location", {"page": "$page"}) as ModelLocation;
    
    final List<Location> locations = dataLocation.results!.map((ResultLocation e) => MapperLocation.locationModelToLocationEntity(e)).toList();
    
    return locations;
  }

  @override
  Future<List<Character>> getResidents(List<int> idCharacters) async{
    final ModelCharacter dataCharacter = await DataSourceImpRickAndMorty()._response("character/$idCharacters", {"":""}) as ModelCharacter;

    final List<Character> characters = dataCharacter.results!.map((ResultCharacter e) => MapperCharacter.characterModelToCharacterEntity(e)).toList();    
    
    return characters;
  }
}