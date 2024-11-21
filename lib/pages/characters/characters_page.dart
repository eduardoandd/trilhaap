import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/model/characters_model.dart';
import 'package:trilhaap/repositories/marvel/characters/characters_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late CharacterRepository characterRepository;
  CharactersModel characters = CharactersModel();

  @override
  void initState() {
    // TODO: implement initState
    characterRepository = CharacterRepository();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    characters = await characterRepository.getCharacters();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
            itemCount:
                (characters.data == null || characters.data!.results == null)
                    ? 0
                    : characters.data!.results!.length,
            itemBuilder: (_, int index) {
              var character = characters.data!.results![index];
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      character.thumbnail!.path! +
                          "." +
                          character.thumbnail!.extension!,
                      width: 150,
                      height: 150,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(character!.name!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            Text(character!.description!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ));
  }
}
