import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            width: 400,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/background_menu.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.orange,
                border: Border.all(
                  color: Colors.pink.shade300,
                  width: 3.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
                ]),
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: 200,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                        color: Colors.pink.shade300,
                        width: 3.0,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ]),
                  child: const Align(
                    child: Text('LOG IN OR REGISTER PAGE'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 80,
                width: 180,
                margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                      color: Colors.pink.shade300,
                      width: 3.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ]),
                child: const Align(
                  child: Text('LOG IN'),
                ),
              ),
              Container(
                height: 80,
                width: 180,
                margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                      color: Colors.pink.shade300,
                      width: 3.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ]),
                child: const Align(
                  child: Text('REGISTER'),
                ),
              )
            ],
          ),
          Container(
            height: 160,
            width: 390,
            margin: const EdgeInsets.only(top: 30.0),
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(
                  color: Colors.pink.shade300,
                  width: 3.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
                ]),
            child: Align(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    WavyAnimatedText('ERAY BAHÇEGÜLÜ'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
