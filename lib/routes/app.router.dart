import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/data/repositories/auth/auth_local.repository.dart';
import 'package:notes_app/data/repositories/note/note_local.repository.dart';
import 'package:notes_app/domains/note/use_cases/create_note.use_case.dart';
import 'package:notes_app/ui/ui.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
  initialLocation: HomePage.routeID,
  redirect: _redirect,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: HomePage.routeID,
      builder: (context, _) {
        return ListenableProvider(
          create: (context) => HomeViewModel(
            localRepository: context.read<NoteLocalRepository>(),
          ),
          builder: (context, _) =>
              HomePage(viewModel: context.read<HomeViewModel>()),
        );
      },
    ),
    GoRoute(path: SignInPage.routeID, builder: (_, _) => SignInPage()),
    GoRoute(path: RegisterPage.routeID, builder: (_, _) => RegisterPage()),
    GoRoute(
      path: NoteFormPage.routeID,
      builder: (context, _) => ListenableProvider(
        create: (context) => NoteFormViewModel(
          createNoteUseCase: CreateNoteUseCase(
            localNoteRepository: context.read<NoteLocalRepository>(),
          ),
        ),
        builder: (context, _) =>
            NoteFormPage(viewModel: context.read<NoteFormViewModel>()),
      ),
    ),
  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = context.read<AuthLocalRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == SignInPage.routeID;

  if (!loggedIn) {
    return SignInPage.routeID;
  }

  if (loggingIn) {
    return HomePage.routeID;
  }

  return null;
}
