import 'package:flutter/material.dart';

import 'chainageAvant.controller.dart';
import 'model.regle.dart';

class ChainageAvant extends StatefulWidget {
  @override
  State<ChainageAvant> createState() => _ChainageAvantState();
}

class _ChainageAvantState extends State<ChainageAvant> {
  TextEditingController baseDeFaitController = TextEditingController();
  TextEditingController listeDesRegleController = TextEditingController();
  List<Regle> regles = [
    //   Regle("E.B", "C"),
    //   Regle("F.D", "A"),
    //  Regle("D.E", "B"),
    //  Regle("B.D", "F"),
    //  Regle("E.F", "D"),
  ];
  List<String> fait = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              baseDeFaitController.clear();
              listeDesRegleController.clear();
              regles.clear();
              fait.clear();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.clear),
            ),
          )
        ],
        title: Text("Chainage Avant"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLength: 1,
                decoration: InputDecoration(hintText: "Entrer un fait"),
                controller: baseDeFaitController,
              ),
              FlatButton(
                onPressed: () {
                  fait.add(baseDeFaitController.text.toUpperCase());
                  baseDeFaitController.clear();
                  setState(() {});
                },
                color: Colors.purple,
                child: Text(
                  "Ajouter un fait",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "pour les régle suivez le format suivat A.B=>C donc A et B Alors C")),
              TextFormField(
                decoration: InputDecoration(hintText: "Entrer une régle"),
                controller: listeDesRegleController,
              ),
              FlatButton(
                onPressed: () {
                  List<String> t = listeDesRegleController.text.split("=>");
                  Regle regle =
                      new Regle(t[0].toUpperCase(), t[1].toUpperCase());
                  regles.add(regle);
                  listeDesRegleController.clear();
                  setState(() {});
                },
                color: Colors.purple,
                child: Text(
                  "Ajouter une régle",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("List de régle : " + regles.toString())),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("List de fait : " + fait.toString())),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () {
                  calcAvant(context, regles, fait);
                },
                color: Colors.purple,
                child: Text(
                  "Chainage Avant",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
