import 'package:flutter/material.dart';
import 'PantallaPrincipal.dart'; // Importa PantallaPrincipal para la redirección después del login.

class PantallaInicioSesion extends StatefulWidget {
  @override
  _PantallaInicioSesionState createState() => _PantallaInicioSesionState();
}

class _PantallaInicioSesionState extends State<PantallaInicioSesion> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _ocultarContrasena = true;
  bool _cargando = false;
  String _rolSeleccionado = 'Cliente'; // Valor predeterminado

  // Lista de usuarios, contraseñas y roles válidos
  final Map<String, Map<String, String>> _usuariosValidos = {
    "admin": {"password": "1234", "rol": "Administrador"},
    "cliente": {"password": "abcd", "rol": "Cliente"},
    "empleado": {"password": "5678", "rol": "Empleado"},
  };

  Future<void> _iniciarSesion() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _cargando = true;
      });

      await Future.delayed(const Duration(seconds: 2)); // Simula una llamada de red.

      setState(() {
        _cargando = false;
      });

      // Verifica si el usuario, contraseña y rol coinciden con alguna entrada en _usuariosValidos
      final usuarioData = _usuariosValidos[_usuarioController.text];
      if (usuarioData != null &&
          usuarioData["password"] == _contrasenaController.text &&
          usuarioData["rol"] == _rolSeleccionado) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PantallaPrincipal()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: const Text("Usuario, contraseña o rol incorrectos"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Aceptar"),
              ),
            ],
          ),
        );
      }
    }
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                DropdownButtonFormField<String>(
                  value: _rolSeleccionado,
                  items: ['Cliente', 'Administrador', 'Empleado']
                      .map((rol) => DropdownMenuItem(
                            value: rol,
                            child: Text(rol),
                          ))
                      .toList(),
                  onChanged: (nuevoRol) {
                    setState(() {
                      _rolSeleccionado = nuevoRol!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Rol',
                    prefixIcon: Icon(Icons.person_outline, color: Colors.lightBlue[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecciona tu rol';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    prefixIcon: Icon(Icons.person_outline, color: Colors.lightBlue[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu usuario';
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
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.lightBlue[700]),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarContrasena ? Icons.visibility : Icons.visibility_off,
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
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
