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
  Info? _info;
  int _page = 1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await requestCharacters();
    });
  }

  requestCharacters() async {
      ApiProvider api = ApiProvider();
      RickAndMorty response = await api.getCharacters({'page': _page.toString()});
      setState(() {
        _info = response.info!;
        _characters = response.results;
      });
  }

    Future<void> _dialogBuilder(BuildContext context, Results character) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${character.name}'),
          content: Container(
            child: Column(
              children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  character.image!,
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              ],
            ),),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick And Morty Characters"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: _info!.prev != null ? null : Colors.grey,
              onPressed: _info!.prev != null ? () { 
                setState(() {
                  _page = _page - 1;
                });
                requestCharacters();
              } : null,
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _page = _page + 1;
                });
                requestCharacters();
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _info!.count,
        itemBuilder: (context, index) {
          final item = _characters![index];
          return InkWell(
            onTap: () {
              _dialogBuilder(context, item);
            },
            child: Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  item.image!,
                  height: 60.0,
                  width: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(item.name!),
              subtitle: Text(item.gender!),
            ),
          ),
          );
        },
      ),
    );
  }
}
