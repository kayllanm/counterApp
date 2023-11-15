import 'package:auto_route/auto_route.dart';
import 'package:counterapp/pages/characters/entities/rick_and_morty_entity.dart';
import 'package:counterapp/pages/characters/http_api_repository.dart';
import 'package:flutter/material.dart';

@RoutePage() 
class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  List<Results>? _characters = [];
    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ApiProvider api = ApiProvider();
      RickAndMorty response = await api.getCharacters({'page': 0});
      setState(() {
          _characters = response.results;
        });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: const Text("Char view"),
    );
  }
}
