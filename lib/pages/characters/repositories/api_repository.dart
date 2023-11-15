import 'package:counterapp/pages/characters/entities/rick_and_morty_entity.dart';

abstract class ApiRepository {
  Future<RickAndMorty> getCharacters(body);
}
