import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/domain/providers/auth/state.dart';
import 'package:owwn_coding_challenge/domain/providers/providers.dart';
import 'package:owwn_coding_challenge/ui/auth/auth.dart';
import 'package:owwn_coding_challenge/ui/home/home.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);

    // Custom color for status bar and navigation bar. 
    setStatusBarColors();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OWWN Coding Challenge',
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: (auth is AuthLoaded) ? const HomePage() : const AuthPage(),
    );
  }
}
