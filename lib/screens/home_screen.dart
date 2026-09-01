import 'package:flutter/material.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gênesis Pro'), actions: [
        IconButton(icon: const Icon(Icons.settings), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())))
      ]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Bem-vindo!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          const Text('🌍 Mercado de Afiliados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0066CC))),
          const Divider(),
          _item(context, icon: Icons.public, title: 'Brasil — Shopee', subtitle: 'Produtos virais em Reais'),
          _item(context, icon: Icons.attach_money, title: 'EUA — Dólar', subtitle: 'Amazon, AliExpress, ClickBank'),
          _item(context, icon: Icons.euro_symbol, title: 'Europa — Euro', subtitle: 'Awin, Digistore24, Amazon EU'),
          const SizedBox(height: 24),
          const Text('🎬 Estúdio de Criação', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFE50914))),
          const Divider(),
          _item(context, icon: Icons.video_collection, title: 'Vídeos Bíblicos', subtitle: 'Roteiro, avatares, voz, legenda'),
          _item(context, icon: Icons.image, title: 'Gerador de Imagens', subtitle: 'Artes, capas e banners'),
          _item(context, icon: Icons.person, title: 'Avatares Animados', subtitle: 'Personagens em movimento'),
          _item(context, icon: Icons.mic, title: 'Estúdio de Vozes', subtitle: 'Narração com emoção em PT/EN'),
          _item(context, icon: Icons.subtitles, title: 'Legendas Sincronizadas', subtitle: 'Automáticas e coloridas'),
          const SizedBox(height: 24),
          const Text('🧠 Ferramentas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(),
          _item(context, icon: Icons.shopping_cart, title: 'Catálogo Automático', subtitle: 'Importa produtos e gera links'),
          _item(context, icon: Icons.analytics, title: 'Análise da IA', subtitle: 'Recomenda os melhores produtos'),
        ],
      ),
    );
  }

  Widget _item(BuildContext _, {required IconData icon, required String title, required String subtitle}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, size: 32, color: const Color(0xFF0066CC)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => ScaffoldMessenger.of(_).showSnackBar(SnackBar(content: Text('$title — Em desenvolvimento! Em breve ativo.'))),
      ),
    );
  }
}
