import 'package:flutter/material.dart';

Widget scoreBoard(String baslik, String bilgi) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(26),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 26),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            baslik,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            bilgi,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    ),
  );
}
