import 'dart:core';


import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emalta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricoes.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _indexNow = 0;

  void search()async {
                    String? res = await showSearch(
                        context: context, delegate: CustomSearchDelegate());
                    
                    print("Res = " + res.toString());
                  }

  List<Widget> telas = [inicio(), emalta(), inscricoes(), biblioteca()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
          child: Image.asset(
            "images/youtube.png",
            height: 25,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Row(children: [
              IconButton(
                  color: Color.fromARGB(255, 145, 142, 142),
                  onPressed: search,
                  icon: Icon(Icons.search)),
              /* IconButton(
                  color: Color.fromARGB(255, 145, 142, 142),
                  onPressed: () {
                    print("Ação videocam");
                  },
                  icon: Icon(Icons.videocam)),
             
              IconButton(
                  color: Color.fromARGB(255, 145, 142, 142),
                  onPressed: () {
                    print("Ação account");
                  },
                  icon: Icon(Icons.account_circle))
                */
            ]),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indexNow],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexNow,
          onTap: (index) {
            setState(() {
              _indexNow = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
            BottomNavigationBarItem(
                icon: Icon(Icons.whatshot), label: "Em alta"),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: "Inscrições"),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: "Biblioteca"),
          ]),
    );
  }
}
