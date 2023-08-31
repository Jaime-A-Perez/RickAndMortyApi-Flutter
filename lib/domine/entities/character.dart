/// Character characteristics
class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginCharacter origin;
  final LocationCharacter location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});
}

/// Name and link to the character's last known location endpoint.
class LocationCharacter {
  
  final String name;
  final String url;

  LocationCharacter({required this.name, required this.url});
}

/// Name and link to the character's origin location.
class OriginCharacter {

  final String name;
  final String url;

  OriginCharacter({required this.name, required this.url});
}