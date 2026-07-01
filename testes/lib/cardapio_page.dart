import 'package:flutter/material.dart';
import 'widgets.dart';

// Tela nova #1 - StatelessWidget, só exibe informação (não precisa de estado).
class CardapioPage extends StatelessWidget {
  const CardapioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cardápio 🍕"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SectionTitle("Tamanhos"),
            const ItemCardapio(
              nome: "Pequena",
              preco: "R\$ 40,00",
              icone: Icons.local_pizza,
              delayMs: 0,
            ),
            const ItemCardapio(
              nome: "Média",
              preco: "R\$ 50,00",
              icone: Icons.local_pizza,
              delayMs: 100,
            ),
            const ItemCardapio(
              nome: "Grande",
              preco: "R\$ 150,00",
              icone: Icons.local_pizza,
              delayMs: 200,
            ),
            const SectionTitle("Bebidas"),
            const ItemCardapio(
              nome: "Coca-Cola 2L",
              preco: "R\$ 10,00",
              icone: Icons.local_drink,
              delayMs: 300,
            ),
            const ItemCardapio(
              nome: "Guaraná 2L",
              preco: "R\$ 12,00",
              icone: Icons.local_drink,
              delayMs: 400,
            ),
            const ItemCardapio(
              nome: "Suco 1,5L",
              preco: "R\$ 8,00",
              icone: Icons.local_drink,
              delayMs: 500,
            ),
          ],
        ),
      ),
    );
  }
}
