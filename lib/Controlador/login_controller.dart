import 'package:cool_track/Modelo/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final AuthService _authService = AuthService();

  Future<User?> login(String email, String password) {
    return _authService.login(email, password);
  }

  Future<User?> register(String email, String password, String role) {
    return _authService.register(email, password, role);
  }

  Future<void> logout() {
    return _authService.logout();
  }

  User? get currentUser => _authService.currentUser;

  Future<String?> getUserRole(String uid) {
    return _authService.getUserRole(uid);
  }
}
