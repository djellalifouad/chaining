import 'package:flutter/material.dart';
import 'package:chaining/widget.home.dart';
import 'package:flutter/material.dart';

import 'model.regle.dart';

calcAvant(
    BuildContext context, List<Regle> regles, List<String> baseDeFait) async {
  List<Regle> regleUsed = [];
  bool finish = false;
  List<String> improved = regles.elementAt(0).a.split(".");
  while (!finish) {
    finish = true;
    for (int i = 0; i < regles.length; i++) {
      List<String> improved = regles.elementAt(i).a.split(".");
      if (improved.every((element) => baseDeFait.contains(element)) &&
          !baseDeFait.contains(regles.elementAt(i).b)) {
        finish = false;
        baseDeFait.add(regles.elementAt(i).b);
        regleUsed.add(regles.elementAt(i));
        regles.removeAt(i);
      }
    }
  }
  print(baseDeFait);
  print(regleUsed);
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Résult"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Text("Les fait prouvé :"),
            SizedBox(
              height: 10,
            ),
            Text(baseDeFait.toString()),
            SizedBox(
              height: 10,
            ),
            Text("Régle utilisé"),
            SizedBox(
              height: 10,
            ),
            Text(regleUsed.toString())
          ],
        ),
      );
    },
  );
}
