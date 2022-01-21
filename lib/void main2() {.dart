void mtest() {
  List<String> baseDeFait = ["E", "F"];
  List<Regle> regles = [
    Regle("E.B", "C"),
    Regle("F.D", "A"),
    Regle("D.E", "B"),
    Regle("B.D", "F"),
    Regle("E.F", "D"),
  ];
  List<String> pile = ["C"];
  List<String> entailed = [];
  while (pile.isNotEmpty) {
    String currentSymbol = pile.removeLast();
    entailed.add(currentSymbol);
    if (!baseDeFait.contains(currentSymbol)) {
      List<String> p = [];
      for (int i = 0; i < regles.length; i++) {
        if (regles.elementAt(i).b == currentSymbol) {
          List<String> temp = regles.elementAt(i).a.split(".");
          p.addAll(temp);
        }
      }
      if (p.length == 0) {
        print("impossible");
      } else {
        for (int i = 0; i < p.length; i++) {
          if (!entailed.contains(p.elementAt(i))) {
            pile.add(p.elementAt(i));
          }
        }
      }
    }
  }
  print(entailed);
}

class Regle {
  String a;
  String b;
  Regle(this.a, this.b);
  toString() {
    return this.a + "=>" + this.b;
  }
}
