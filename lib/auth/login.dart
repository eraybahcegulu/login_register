import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_register/screens/welcome.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GİRİŞ YAP'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-posta',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    LengthLimitingTextInputFormatter(9),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              FractionallySizedBox(
                widthFactor: 0.3,
                child: ElevatedButton(
                  onPressed: _isLoggingIn
                      ? null
                      : () async {
                          final email = _emailController.text;
                          final password = _passwordController.text;

                          if (email.isEmpty || password.isEmpty) {
                            _showSnackBar('Boş alanları doldurun.', Colors.red);
                            return;
                          }

                          if (password.length < 6) {
                            _showSnackBar('Şifre en az 6 karakter olmalıdır.',
                                Colors.red);
                            return;
                          }

                          setState(() {
                            _isLoggingIn = true;
                          });

                          try {
                            await _auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            _showSnackBar('Giriş yapılıyor...', Colors.green);

                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Welcome()));
                            });
                          } catch (e) {
                            setState(() {
                              _isLoggingIn = false;
                            });

                            if (e is FirebaseAuthException) {
                              if (e.code == 'invalid-email') {
                                _showSnackBar('E-Posta hatalı.', Colors.red);
                              } else if (e.code == 'wrong-password') {
                                _showSnackBar('Şifre hatalı.', Colors.red);
                              } else if (e.code == 'user-not-found') {
                                _showSnackBar('Bu E-Posta kayıtlı değil.',
                                    Colors.red);
                              }
                            }
                          }
                        },
                  child: Text('Giriş Yap'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
