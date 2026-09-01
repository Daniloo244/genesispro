import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme_provider.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FlutterTts _tts = FlutterTts();
  bool _ttsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('♿ Acessibilidade', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(),
          SwitchListTile(title: const Text('Modo Escuro'), value: theme.themeMode == ThemeMode.dark, onChanged: (v) => theme.toggleTheme(v)),
          ListTile(title: const Text('Tamanho da Fonte'), subtitle: Slider(value: theme.fontScale, min: 0.8, max: 1.5, divisions: 7, label: '${(theme.fontScale * 100).toInt()}%', onChanged: theme.setFontScale)),
          Slider(value: theme.fontScale, min: 0.8, max: 1.5, divisions: 7, onChanged: theme.setFontScale),
          SwitchListTile(title: const Text('Leitura em Voz Alta'), subtitle: const Text('O app lê os textos em português'), value: _ttsEnabled, onChanged: (v) => setState(() => _ttsEnabled = v)),
          const SizedBox(height: 24),
          const Text('🔗 Credenciais das Plataformas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(),
          const TextField(decoration: InputDecoration(labelText: 'ID Afiliado Shopee', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Chave API Shopee', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Tag Amazon EUA', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Pixel Meta (Facebook/Instagram)', border: OutlineInputBorder())),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: () async {
            if (_ttsEnabled) await _tts.speak('Configurações salvas com sucesso! Bem-vindo ao Gênesis Pro.');
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Configurações salvas com sucesso!')));
          }, child: const Text('Salvar Tudo', style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}
