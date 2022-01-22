import 'package:chaining/widget.chainageArriere.dart';
import 'package:chaining/widget.chainageAvant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "mini projet IC",
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(7.sp)),
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
            child: Column(
              children: [
                Text(
                  "les étudiants : ",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- Hanani fetheddine",
                      style: TextStyle(fontSize: 13.sp, color: Colors.indigo),
                    ),
                    Text(
                      "- Djellali fouad",
                      style: TextStyle(fontSize: 13.sp, color: Colors.indigo),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
                Text(
                  "SIW 01",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            child: Column(
              children: [
                Card(
                  color: Colors.orange,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChainageAvant()));
                    },
                    title: const Center(
                      child: Text(
                        "Chainage Avant",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.orange,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChainnageArriere()));
                    },
                    title: const Center(
                      child: Text(
                        "Chainage Arriére",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 20),
// child: Column(
// children: [
// SizedBox(height: 20),
// Card(
// child: ListTile(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => ChainageAvant()));
// },
// title: Text("Chainage Avant"),
// ),
// ),
// Card(
// child: ListTile(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => ChainnageArriere()));
// },
// title: Text("Chainage Arriére"),
// ),
// ),
// ],
// ),
// ),
