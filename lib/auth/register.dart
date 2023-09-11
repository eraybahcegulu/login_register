import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Register extends StatelessWidget {
  const Register({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KAYIT OL'),
      ),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 16.0),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  LengthLimitingTextInputFormatter(9),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            FractionallySizedBox(
              widthFactor: 0.25,
            child: ElevatedButton(
              onPressed: _isRegistering
                  ? null
                  : () async {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      if (email.isEmpty || password.isEmpty) {
                        _showSnackBar('Boş alanları doldurun.', Colors.red);
                        return;
                      }

                      try {
                        setState(() {
                          _isRegistering = true;
                        });

                        final UserCredential userCredential =
                            await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        if (userCredential.user != null) {
                          _showSnackBar('Kayıt başarılı.', Colors.green);
                        }
                      } catch (e) {
                        setState(() {
                          _isRegistering = false;
                        });

                        if (e is FirebaseAuthException) {
                          if (e.code == 'email-already-in-use') {
                            _showSnackBar('Bu E-Posta Adresi zaten kayıtlı.', Colors.red);
                          } else if (e.code == 'weak-password') {
                            _showSnackBar('Şifre en az 6 karakter olmalıdır.', Colors.red);
                          } else if (e.code == 'invalid-email') {
                            _showSnackBar('Geçerli bir e-posta adresi girin.', Colors.red);
                          }
                        }
                      }
                    },
              child: Text('Kayıt Ol'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                elevation: 5,
              ),
            ),
            ),
          ],
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
