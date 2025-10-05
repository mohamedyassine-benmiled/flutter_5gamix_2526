import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _currentPasswordError;
  String? _newPasswordError;
  String? _addressError;

  void _submit() {
    setState(() {
      _currentPasswordError = null;
      _newPasswordError = null;
      _addressError = null;
    });
    bool hasError = false;
    if (_currentPasswordController.text.isEmpty) {
      _currentPasswordError = "Veuillez entrer le mot de passe actuel";
      hasError = true;
    }
    if (_newPasswordController.text.isEmpty) {
      _newPasswordError = "Veuillez entrer le nouveau mot de passe";
      hasError = true;
    }
    if (_addressController.text.isEmpty) {
      _addressError = "Veuillez entrer l'adresse de facturation";
      hasError = true;
    }
    setState(() {});
    if (!hasError) {
      // Save logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Modifications enregistrées (simulation)')),
      );
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres du profil'),
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
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: TextField(
                    controller: _currentPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Mot de passe actuel",
                      errorText: _currentPasswordError,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Nouveau mot de passe",
                      errorText: _newPasswordError,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: _addressController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Adresse de facturation",
                      errorText: _addressError,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Enregistrer'),
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

