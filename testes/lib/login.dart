import 'package:flutter/material.dart';
import 'main.dart';
import 'cardapio_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController =
      TextEditingController();

  TextEditingController senhaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Dudu Pizzeria 🍕"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Animação simples: o ícone "cresce" ao abrir a tela.
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 700),
              curve: Curves.elasticOut,
              builder: (context, valor, child) {
                return Transform.scale(scale: valor, child: child);
              },
              child: Icon(
                Icons.local_pizza,
                size: 100,
                color: Colors.orange,
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: emailController,

              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: senhaController,
              obscureText: true,

              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => PedidoPage(),
                  ),
                );
              },

              child: Text("Entrar"),
            ),

            SizedBox(height: 10),

            // Tela nova acessível a partir do login, sem precisar logar.
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardapioPage(),
                  ),
                );
              },
              child: Text("Ver Cardápio"),
            ),
          ],
        ),
      ),
    );
  }
}
