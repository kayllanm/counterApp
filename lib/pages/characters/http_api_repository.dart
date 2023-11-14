
import 'package:counterapp/pages/characters/entities/rick_and_morty_entity.dart';

class HttpApiRepository implements ApiRepository {
  HttpApiRepository({required this.api, required this.client});
  // custom class defining all the API details
  final RickAndMortyAPI api;
  // client for making calls to the API
  final http.Client client;
  
  @override
  Future<RickAndMorty> getCharacter({p1}) {
    // TODO: implement getCharacter
    throw UnimplementedError();
  }
  
  @override
  Future<RickAndMorty> getCharacterById({required int id}) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }
}

abstract class ApiRepository {
  Future<RickAndMorty> getCharacter();
  Future<RickAndMorty> getCharacterById({required int id});
}
