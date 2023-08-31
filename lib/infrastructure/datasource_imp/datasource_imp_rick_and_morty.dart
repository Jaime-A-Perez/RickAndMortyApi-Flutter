import 'package:rick_and_morty/domine/datasources/datasource_rick_and_morty.dart';
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/domine/entities/epidode.dart';
import 'package:rick_and_morty/infrastructure/models/model_character.dart';
import 'package:http/http.dart' as http;

class DataSourceImpRickAndMorty extends DataSourceRickAndMorty {

  Future<ModelCharacter> _response(Map<String,String> queryParameter) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'rickandmortyapi.com',
      path: '/api',
      queryParameters: queryParameter 
    );

    final response = await http.get(uri);

    if (response.statusCode < 200 || response.statusCode > 299) {
        throw Exception("Error code: ${response.statusCode}");
      }    
    final ModelCharacter modelCharacter = modelCharacterFromJson(response.body);
    return modelCharacter;
  }

  @override
  Future<List<Character>> getCharacter(int page) {
    // TODO: implement getCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<Episode>> getEpisode(int page) {
    // TODO: implement getEpisode
    throw UnimplementedError();
  }

  @override
  Future<List<Location>> getLocation(int page) {
    // TODO: implement getLocation
    throw UnimplementedError();
  }



}