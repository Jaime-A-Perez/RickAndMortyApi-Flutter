
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/infrastructure/models/model_character.dart';

class MapperCharacter {
  static Character characterModleToCharacterEntity( ResultCharacter resultCharacter ) {
    return Character(
     id: resultCharacter.id ?? 999333,
     name: resultCharacter.name ?? "unknow",
     status: resultCharacter.status ?? "unknow",
     species: resultCharacter.species ?? "unknow",
     type: resultCharacter.type ?? "unknow",
     gender: resultCharacter.gender ?? "unknow",
     origin: OriginCharacter(
      name: resultCharacter.origin?.name ?? "unknow",
      url: resultCharacter.origin?.url ?? "unknow"
      ),
     location: LocationCharacterEntity(      
      name: resultCharacter.location?.name ?? "unknow",
      url: resultCharacter.location?.url ?? "unknow"      
     ),
     image: resultCharacter.image ?? "unknow",
     episode: resultCharacter.episode ?? [],
     url: resultCharacter.url ?? "unknow",
     created: resultCharacter.created ?? "unknow");

  }
}