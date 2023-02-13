import 'package:flutter/material.dart';
import 'package:my_first_app/customs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: myGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: myAppBar(),
        drawer: myDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(40.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const Icon(
                //   Icons.person,
                // ),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
