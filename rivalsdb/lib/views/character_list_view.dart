import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/character_viewmodel.dart';
import '../widgets/character_card.dart';

class CharacterListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharacterViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text("RivalsDB")),
      body: viewModel.isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: viewModel.characters.length,
            itemBuilder: (context, index) {
              final character = viewModel.characters[index];
              return SizedBox(
                height: 120,
                child: CharacterCard(
                  character: character,
                  onTap: () {
                    //TODO: Navigate to detail view
                    print("Tapped on ${character.name}");
                  }
                ),
              );
            },
        ),
    );
  }
}