import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Opacity(
            opacity: 1.0,
            child: Image.asset(
              "assets/images/Quiz-Logo.png",
              width: 350,
              // color: const Color.fromARGB(83, 255, 255, 255),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            "Learn Flutter The Fun Way",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontFamily: "Rubik Medium",
                fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple.shade100,
                  shape: StadiumBorder(),
                  side: BorderSide(
                      color: Colors.white, width: 2, style: BorderStyle.solid)),
              icon: Icon(
                Icons.arrow_right_alt_rounded,
                size: 25,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              label: Text(
                "Start Now",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Rubik Medium",
                    color: Colors.white),
              )),
        )
      ],
    );
  }
}
