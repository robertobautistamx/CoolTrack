// ignore_for_file: library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

class AuthService {
  final fbAuth.FirebaseAuth _firebaseAuth = fbAuth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Registro de usuario con rol
  Future<fbAuth.User?> register(
      String email, String password, String role) async {
    try {
      fbAuth.UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Almacenar el rol en Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'email': email,
        'role': role,
      });

      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  // Inicio de sesión
  Future<fbAuth.User?> login(String email, String password) async {
    try {
      fbAuth.UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  // Obtener rol del usuario
  Future<String?> getUserRole(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      return doc['role'] as String?;
    } catch (e) {
      return null;
    }
  }

  // Cerrar sesión
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  // Obtener usuario actual
  fbAuth.User? get currentUser => _firebaseAuth.currentUser;
}
