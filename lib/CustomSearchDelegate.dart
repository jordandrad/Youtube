import 'package:flutter/material.dart';

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
    //print("Resultado: pesquisa realizada");
    close(context, query);
    return Text("B");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("Resultado digitado: " + query);
    return Text("sup");
  }
}
