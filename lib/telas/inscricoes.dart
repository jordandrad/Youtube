import 'package:flutter/material.dart';

class inscricoes extends StatefulWidget {
  const inscricoes({Key? key}) : super(key: key);

  @override
  State<inscricoes> createState() => _inscricoesState();
}

class _inscricoesState extends State<inscricoes> {
  @override
  Widget build(BuildContext context) {
    return Container(  child: Center(
        child: Text("Inscrições",
        style: TextStyle(
          fontSize: 25,
        ),
        ),
      ),);
  }
}
