
import 'dart:convert';

import 'package:counterapp/pages/characters/entities/rick_and_morty_entity.dart';
import 'package:counterapp/pages/characters/repositories/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiProvider implements ApiRepository {
  ApiProvider();
  
  @override
  Future<RickAndMorty> getCharacters(body) async {
    var url = Uri.https('rickandmortyapi.com', 'api/character', body);
    var response = await http.get(url);
    RickAndMorty responseData;
    if (response.statusCode == 200) {
      responseData = RickAndMorty.fromJson(jsonDecode(response.body));
    } else {
      responseData = RickAndMorty.fromJson(<String, dynamic>{
          "code": 500,
          "success": false,
          "message": "The server did not respond correctly. Please try again later.",
          "response": null,
        });
    }
    return responseData;
  }
}
