import 'package:notes_app/data/repositories/auth/auth.repository.dart';

class AuthLocalRepository extends AuthRepository {
  final isAuthenticated = true;

  @override
  Future<void> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}
