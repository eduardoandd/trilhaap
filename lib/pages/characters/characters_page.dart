// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

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
  ScrollController _scrollController = ScrollController();
  CharactersModel characters = CharactersModel();
  int offset = 0;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      var posicaoParaPaginar = _scrollController.position.maxScrollExtent *0.7;
      // print(_scrollController.position.pixels);
      if (_scrollController.position.pixels >= posicaoParaPaginar) {
        carregarDados();
      }
    });
    characterRepository = CharacterRepository();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (loading) return;

    if (characters.data == null || characters.data!.results == null) {
      characters = await characterRepository.getCharacters(offset);
    } else {
      setState(() {
        loading = true;
      });
      offset = offset + characters.data!.count!;
      var tempList = await characterRepository.getCharacters(offset);
      characters.data!.results!.addAll(tempList.data!.results!);
      loading = false;
    }

    setState(() {});
  }

  int totalReturn() {
    try {
      return characters.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int currentQuantity() {
    try {
      return offset + characters.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:Text("Herois: ${currentQuantity()}/${totalReturn()}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: characters.data != null ? ListView.builder(
                controller: _scrollController,
                itemCount: (characters.data == null ||
                        characters.data!.results == null)
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
                                Text(character.name!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                Text(character.description!),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }) 
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    ));
  }
}
