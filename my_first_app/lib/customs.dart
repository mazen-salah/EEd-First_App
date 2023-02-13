import 'package:flutter/material.dart';

const Color lightBlue = Color(0xFF3366FF);
const myGradient = LinearGradient(
  colors: [
    lightBlue,
    Color(0xFF00CCFF),
  ],
  begin: FractionalOffset(0.0, 0.0),
  end: FractionalOffset(1.0, 0.0),
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

AppBar myAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: const Text("My first App"),
    centerTitle: true,
  );
}

Drawer myDrawer() => const Drawer();
