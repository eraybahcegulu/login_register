import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              
              labelText: 'E-posta',
              
            ),
            inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Şifre',
            ),
            inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                LengthLimitingTextInputFormatter(9),
              ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              final email = _emailController.text;
              final password = _passwordController.text;

              if (email.isEmpty || password.isEmpty) {
                _showSnackBar('Boş alanları doldurun.', Colors.red);
                return;
              }

              try {
                final UserCredential userCredential =
                    await _auth.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                if (userCredential.user != null) {
                  _showSnackBar('Kayıt başarılı.', Colors.green);
                }
              } catch (e) {
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
          ),
        ],
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
