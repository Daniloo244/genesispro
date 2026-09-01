import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/theme_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const GenesisProApp());
}

class GenesisProApp extends StatelessWidget {
  const GenesisProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Gênesis Pro',
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.light(),
          darkTheme: ThemeProvider.dark(),
          themeMode: theme.themeMode,
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
