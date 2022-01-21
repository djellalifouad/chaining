import 'package:chaining/widget.chainageArriere.dart';
import 'package:chaining/widget.chainageAvant.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choisir le type de chainage"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChainageAvant()));
                },
                title: Text("Chainage Avant"),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                               Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChainnageArriere()));
                },
                title: Text("Chainage Arriére"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
