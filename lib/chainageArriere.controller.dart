import 'package:flutter/material.dart';
import 'package:chaining/widget.home.dart';
import 'package:flutter/material.dart';

import 'chainageAvant.controller.dart';
import 'model.regle.dart';

calcArriere(BuildContext context, List<Regle> regles, List<String> baseDeFait,
    String goal) async {
  List<String> pile = [goal.toUpperCase()];
  List<String> entailed = [];
  List<Regle> reglesUsed = [];
  print("list regle");
  print(regles);
  print(baseDeFait);

  while (pile.isNotEmpty) {
    String currentSymbol = pile.removeLast();
    entailed.add(currentSymbol);
    if (!baseDeFait.contains(currentSymbol)) {
      List<String> p = [];
      for (int i = 0; i < regles.length; i++) {
        if (regles.elementAt(i).b == currentSymbol) {
          reglesUsed.add(regles.elementAt(i));
          List<String> temp = regles.elementAt(i).a.split(".");
          p.addAll(temp);
        }
      }
      if (p.length == 0) {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            entailed = entailed.reversed.toList();
            for (int i = baseDeFait.length; i < entailed.length; i++) {
              if (baseDeFait.contains(entailed.elementAt(i))) {
                entailed.removeAt(i);
              }
            }
            print(entailed);
            print(reglesUsed.reversed);
            return AlertDialog(
              title: Text("Résult impossible :("),
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
                  Text(entailed.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Régle utilisé"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(reglesUsed.reversed.toString())
                ],
              ),
            );
          },
        );
      } else {
        for (int i = 0; i < p.length; i++) {
          if (!entailed.contains(p.elementAt(i))) {
            pile.add(p.elementAt(i));
          }
        }
      }
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      entailed = entailed.reversed.toList();
      for (int i = baseDeFait.length; i < entailed.length; i++) {
        if (baseDeFait.contains(entailed.elementAt(i))) {
          entailed.removeAt(i);
        }
      }
      print(entailed);
      print(reglesUsed.reversed);
      return AlertDialog(
        title: Text("Résult :)"),
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
            Text(entailed.toString()),
            SizedBox(
              height: 10,
            ),
            Text("Régle utilisé"),
            SizedBox(
              height: 10,
            ),
            Text(reglesUsed.reversed.toString())
          ],
        ),
      );
    },
  );
}
