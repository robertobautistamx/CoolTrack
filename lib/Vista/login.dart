// ignore_for_file: use_build_context_synchronously, unused_import, use_super_parameters

import 'package:cool_track/Controlador/login_controller.dart';
import 'package:flutter/material.dart';
import 'registro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _ocultarContrasena = true;
  bool _cargando = false;

  final LoginController _loginController = LoginController();

  @override
  void dispose() {
    _emailController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  Future<void> _iniciarSesion() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _cargando = true;
      });

      try {
        var user = await _loginController.login(
          _emailController.text.trim(),
          _contrasenaController.text.trim(),
        );

        setState(() {
          _cargando = false;
        });

        if (user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          _mostrarError("No se pudo iniciar sesión");
        }
      } catch (e) {
        setState(() {
          _cargando = false;
        });
        _mostrarError(e.toString());
      }
    }
  }

  void _mostrarError(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  void _navegarARegistro() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(Icons.ac_unit, size: 80, color: Colors.lightBlue[700]),
                const SizedBox(height: 20),
                Text(
                  "Iniciar sesión",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    prefixIcon: Icon(Icons.email_outlined,
                        color: Colors.lightBlue[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu correo electrónico';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _contrasenaController,
                  obscureText: _ocultarContrasena,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon:
                        Icon(Icons.lock_outline, color: Colors.lightBlue[700]),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarContrasena
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.lightBlue[700],
                      ),
                      onPressed: () {
                        setState(() {
                          _ocultarContrasena = !_ocultarContrasena;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                _cargando
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _iniciarSesion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[700],
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: _navegarARegistro,
                  child: const Text("¿No tienes cuenta? Regístrate aquí"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
