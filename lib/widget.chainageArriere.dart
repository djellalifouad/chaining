import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'chainageArriere.controller.dart';
import 'model.regle.dart';

class ChainnageArriere extends StatefulWidget {
  const ChainnageArriere({Key? key}) : super(key: key);

  @override
  _ChainnageArriereState createState() => _ChainnageArriereState();
}

class _ChainnageArriereState extends State<ChainnageArriere> {
  TextEditingController baseDeFaitController = TextEditingController();
  TextEditingController listeDesRegleController1 = TextEditingController();
  TextEditingController listeDesRegleController2 = TextEditingController();
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
        backgroundColor: Colors.orange,
        actions: [
          InkWell(
            onTap: () {
              baseDeFaitController.clear();
              listeDesRegleController1.clear();
              listeDesRegleController2.clear();
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
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: TextFormField(
                  onChanged: (String cc) {
                    baseDeFaitController.text = cc.toUpperCase();
                  },
                  maxLength: 1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.sp),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 1.sp)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.sp),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 0.5.sp)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  controller: baseDeFaitController,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              FlatButton(
                onPressed: () {
                  fait.add(baseDeFaitController.text.toUpperCase());
                  baseDeFaitController.clear();
                  setState(() {});
                },
                color: Colors.purple,
                child: const Text(
                  "Ajouter un fait",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text("séparez avec des points")),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "exemple   A.B",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.sp),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 1.sp)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.sp),
                            borderSide: BorderSide(
                                color: Colors.purple, width: 0.5.sp)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      controller: listeDesRegleController1,
                    ),
                  ),
                  Icon(Icons.arrow_forward_rounded),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "exemple   C.D",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.sp),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 1.sp)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.sp),
                            borderSide: BorderSide(
                                color: Colors.purple, width: 0.5.sp)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      controller: listeDesRegleController2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              FlatButton(
                onPressed: () {
                  List<String> t =
                      listeDesRegleController2.text.toUpperCase().split(".");
                  for (int i = 0; i < t.length; ++i) {
                    Regle regle = new Regle(
                        listeDesRegleController1.text.toUpperCase(),
                        t[i].toUpperCase());
                    regles.add(regle);
                  }
                  listeDesRegleController1.clear();
                  listeDesRegleController2.clear();
                  setState(() {});
                  // Regle regle =
                  //     new Regle(t[0].toUpperCase(), t[1].toUpperCase());
                  // regles.add(regle);
                  // listeDesRegleController.clear();
                  // setState(() {});
                },
                color: Colors.purple,
                child: Text(
                  "Ajouter une régle",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextFormField(
                  onChanged: (String cc) {
                    goalController.text = cc.toUpperCase();
                  },
                  maxLength: 1,
                  decoration: InputDecoration(
                    hintText: "le but",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.sp),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 1.sp)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.sp),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 0.5.sp)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  controller: goalController,
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
                  calcArriere(context, regles, fait,
                      goalController.text.trim().toUpperCase());
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
