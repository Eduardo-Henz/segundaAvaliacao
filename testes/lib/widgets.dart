import 'package:flutter/material.dart';

// Widget Stateless simples, reaproveitado nas telas para não repetir estilo.
class SectionTitle extends StatelessWidget {
  final String texto;

  const SectionTitle(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}

// Card Stateless usado no Cardápio, com animação de entrada simples
// (TweenAnimationBuilder anima da opacidade 0 -> 1 e desliza um pouco).
class ItemCardapio extends StatelessWidget {
  final String nome;
  final String preco;
  final IconData icone;
  final int delayMs;

  const ItemCardapio({
    super.key,
    required this.nome,
    required this.preco,
    required this.icone,
    this.delayMs = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 500 + delayMs),
      curve: Curves.easeOut,
      builder: (context, valor, child) {
        return Opacity(
          opacity: valor,
          child: Transform.translate(
            offset: Offset(0, (1 - valor) * 20),
            child: child,
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icone, color: Colors.orange, size: 32),
          title: Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: Text(
            preco,
            style: const TextStyle(fontSize: 16, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
