import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:login_register/auth/login.dart';
import 'package:login_register/auth/register.dart';
class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 440,
            width: 380,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/eraybahcegulu.jpg'),
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
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0), // Üst margin ekleniyor
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Düğmeleri yatayda merkezle
              children: [
                // Düğme 1
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(color: Colors.pink.shade300, width: 3.0),
                      elevation: 10,
                    ),
                    child: const SizedBox(
                      width: 150, // Genişlik
                      height: 50, // Yükseklik
                      child: Center(
                        child: Text('LOG IN'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // İki düğme arasına boşluk ekledik
                // Düğme 2
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(color: Colors.pink.shade300, width: 3.0),
                      elevation: 10,
                    ),
                    child: const SizedBox(
                      width: 150, // Genişlik
                      height: 50, // Yükseklik
                      child: Center(
                        child: Text('REGISTER'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 380,
            margin: const EdgeInsets.only(top: 20.0),
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
