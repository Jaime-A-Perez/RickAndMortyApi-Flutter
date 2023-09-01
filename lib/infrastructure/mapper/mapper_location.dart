import 'package:rick_and_morty/domine/entities/location.dart';
import 'package:rick_and_morty/infrastructure/models/model_location.dart';

class MapperLocation {
  static Location locationModelToLocationEntity (ResultLocation resultLocation) {
    return Location(
     id: resultLocation.id!,
     name: resultLocation.name ?? "unknown",
     type: resultLocation.type ?? "unknown",
     dimension: resultLocation.dimension ?? "unknown",
     residents: resultLocation.residents ?? ["unknown"],
     url: resultLocation.url ?? "unknown",
     created: resultLocation.created ?? "unknown");

  }
} 