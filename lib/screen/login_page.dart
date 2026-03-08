import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            inputUsername(),
            inputPasswrod(),
            Row(
              children: [
                Expanded(child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white
                  ),
                  onPressed: (){
                    handleLogin();
                }, child: Text("Login"))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget inputUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Username"), // Label
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Masukan Username",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget inputPasswrod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Password"), // Label
        TextField(
          controller: _passwordController,
          obscureText: _obscure,
          decoration: InputDecoration(
            hintText: "Masukan Username",
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
              icon: _obscure
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
          ),
        ),
      ],
    );
  }

  void handleLogin(){
    if (_usernameController.text == 'arya' && _passwordController.text == '089'){
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Salah"))
      );
    }
  }
}
