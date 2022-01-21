import 'package:flutter/material.dart';

import 'chainageArriere.controller.dart';
import 'model.regle.dart';

class ChainnageArriere extends StatefulWidget {
  const ChainnageArriere({Key? key}) : super(key: key);

  @override
  _ChainnageArriereState createState() => _ChainnageArriereState();
}

class _ChainnageArriereState extends State<ChainnageArriere> {
  TextEditingController baseDeFaitController = TextEditingController();
  TextEditingController listeDesRegleController = TextEditingController();
  TextEditingController goalController = TextEditingController();
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
        title: Text("Chainage Arriére"),
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
                  fait.add(baseDeFaitController.text.trim().toUpperCase());
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
                  List<String> t = listeDesRegleController.text.trim().split("=>");
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
              TextFormField(
                decoration: InputDecoration(hintText: "Entrer le but"),
                controller: goalController,
                onChanged: (value) {
                  setState(() {});
                },
                maxLength: 1,
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
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Le but : " + goalController.text.toUpperCase())),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () {
                  print(goalController.text);
                  calcArriere(
                      context, regles, fait, goalController.text.trim().toUpperCase());
                },
                color: Colors.purple,
                child: Text(
                  "Chainage Arriére",
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
