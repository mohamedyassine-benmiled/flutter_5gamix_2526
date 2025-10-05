import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String? _username;
  String? _usernameError;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();

  void _submit() {
    setState(() {
      _usernameError = null;
    });
    _formKey.currentState!.save();
    bool hasError = false;
    if (_username == null || _username!.isEmpty) {
      setState(() {
        _usernameError = "Veuillez entrer un nom d'utilisateur";
      });
      hasError = true;
    }
    if (!hasError) {
      // Reset password logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lien de réinitialisation envoyé (simulation)')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réinitialiser le mot de passe'),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Image.asset('assets/images/minecraft.jpg', width: 460, height: 215),
          ),
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
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Réinitialiser le mot de passe'),
                    onPressed: _submit,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

