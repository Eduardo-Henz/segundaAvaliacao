import 'package:flutter/material.dart';

class CardPromocao extends StatelessWidget {
  final String titulo;
  final String descricao;
  final IconData icone;
  final Color cor;

  const CardPromocao({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.icone,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: cor.withOpacity(0.15),
          child: Icon(
            icone,
            color: cor,
          ),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(descricao),
      ),
    );
  }
}