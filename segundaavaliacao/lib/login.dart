import 'package:flutter/material.dart';

import 'promocoes.dart';

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

            Icon(
              Icons.local_pizza,
              size: 100,
              color: Colors.orange,
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
                    builder: (context) => const PromocoesPage(),
                  ),
                );
              },

              child: Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}


