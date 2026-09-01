import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  bool _isFirst = false;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    _isFirst = prefs.getString('user') == null;
    setState(() {});
  }

  Future<void> _saveAndEnter() async {
    if (_userController.text.isEmpty || _passController.text.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    if (_isFirst) {
      await prefs.setString('user', _userController.text);
      await prefs.setString('pass', _passController.text);
    } else {
      final u = prefs.getString('user'), p = prefs.getString('pass');
      if (_userController.text != u || _passController.text != p) return;
    }
    if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome, size: 64, color: Color(0xFF0066CC)),
              const SizedBox(height: 16),
              const Text('Gênesis Pro', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('"O começo de tudo: fé, criação e resultados"', style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 32),
              TextField(controller: _userController, decoration: const InputDecoration(labelText: 'Usuário', border: OutlineInputBorder())),
              const SizedBox(height: 16),
              TextField(controller: _passController, obscureText: true, decoration: const InputDecoration(labelText: 'Senha', border: OutlineInputBorder())),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _saveAndEnter, style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16)),
                child: Text(_isFirst ? 'Criar Acesso' : 'Entrar', style: const TextStyle(fontSize: 18))),
            ],
          ),
        ),
      ),
    );
  }
}
