import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 35),
                child: Image(image: AssetImage('./assets/logoCompleto.png'))),
             SizedBox(
               height: 10,
             ),
             const Text("Sistema de Gestión de Herramienta",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF2F77D2)),textAlign: TextAlign.center),
            const Text("Ingeniar Inoxidables",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF2F77D2)),textAlign: TextAlign.center),
            SizedBox(
                height: 45
            ),
            const Text("Ingrese sus datos de usuario",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              decoration: BoxDecoration(color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: _usernameController,
                    decoration:
                    const InputDecoration(
                        labelText: 'Nombre de usuario',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20))
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 18),
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: _passwordController,
                    decoration:
                    const InputDecoration(
                        labelText: 'Contraseña',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                    obscureText: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                  onPressed: () async {
                    final authProvider = Provider.of<AuthProvider>(context, listen: false);
                    await authProvider.login(_usernameController.text, _passwordController.text);
                    if (authProvider.token != null) {
                      Navigator.pushReplacementNamed(context, '/inventory');
                    }
                  },
                  child: const Text(
                      'Ingresar',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
