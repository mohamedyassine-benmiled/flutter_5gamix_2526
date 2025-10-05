import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String? _username;
  String? _password;
  String? _usernameError;
  String? _passwordError;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    setState(() {
      _usernameError = null;
      _passwordError = null;
    });
    _formKey.currentState!.save();
    bool hasError = false;
    if (_username == null || _username!.isEmpty) {
      setState(() {
        _usernameError = "Veuillez entrer un nom d'utilisateur";
      });
      hasError = true;
    }
    if (_password == null || _password!.isEmpty) {
      setState(() {
        _passwordError = "Veuillez entrer un mot de passe";
      });
      hasError = true;
    }
    if (!hasError) {
      // Auth logic here
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
      ),
      body: ListView(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Image.asset("assets/images/minecraft.jpg", width: 460, height: 215)),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Username",
                      errorText: _usernameError,
                    ),
                    onChanged: (value) {
                      _username = value;
                      setState(() {
                        _usernameError = null;
                      });
                    },
                    onSubmitted: (_) => _submit(),
                    onEditingComplete: () {
                      _formKey.currentState!.save();
                    },
                    onTap: () {
                      setState(() {
                        _usernameError = null;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Mot de passe",
                      errorText: _passwordError,
                    ),
                    onChanged: (value) {
                      _password = value;
                      setState(() {
                        _passwordError = null;
                      });
                    },
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: ElevatedButton(
                      child: const Text("S'authentifier"),
                      onPressed: _submit,
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Text("Créer un compte"),
                      onPressed: () {},
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Mot de passe oublié ?"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Cliquez ici", style: TextStyle(color: Colors.blue))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}