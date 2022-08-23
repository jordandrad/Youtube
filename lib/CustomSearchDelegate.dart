import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/video.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero, () {
      close(context, query);
    });

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("Resultado digitado: " + query);
    List<String> lista = [];
    if (query.isNotEmpty) {
      lista = [
        "Norway",
        "Swedden",
        "France",
        "Alaska",
        "Scotland",
        "Switzerland",
      ]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text("Nenhum reultado encontrado"),
      );
    }
  }
}
