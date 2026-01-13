import 'package:flutter/material.dart';
import 'package:notes_app/data/repositories/auth/auth_local.repository.dart';
import 'package:notes_app/data/repositories/note/note_local.repository.dart';
import 'package:notes_app/data/services/dio_http.service.dart';
import 'package:notes_app/data/services/logger.service.dart';
import 'package:notes_app/routes/app.router.dart';
import 'package:notes_app/ui/ui.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        // Services
        Provider(create: (_) => DioHttpService()),
        Provider(create: (_) => LoggerService()),

        // Repositories
        Provider(create: (_) => NoteLocalRepository()),
        Provider(create: (_) => AuthLocalRepository()),
      ],
      child: AppWidget(),
    ),
  );
  // runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simple Notes App',
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme(),
        useMaterial3: true,
      ),
      routerConfig: router(),
    );
  }
}
