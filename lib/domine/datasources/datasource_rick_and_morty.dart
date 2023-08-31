import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/domine/entities/epidode.dart';
import 'package:rick_and_morty/infrastructure/models/model_character.dart';
/// Represents a data source for retrieving character, episode, and location data.
abstract class DataSourceRickAndMorty {

  Future<List<Character>> getCharacter(int page);

  Future<List<Episode>> getEpisode(int page);
  
  Future<List<Location>> getLocation(int page);


}