import 'package:flutter/material.dart';
import 'main.dart';


class ConfirmacaoPage extends StatefulWidget {
  final String pagamento;
  final double total;

  const ConfirmacaoPage({
    super.key,
    required this.pagamento,
    required this.total,
  });

  @override
  State<ConfirmacaoPage> createState() => _ConfirmacaoPageState();
}

class _ConfirmacaoPageState extends State<ConfirmacaoPage> {
  bool mostrarCheck = false;
  int tempoEntrega = 0;

  @override
  void initState() {
    super.initState();

    
    tempoEntrega = calcularTempoEntrega(widget.total);

    //animação (AnimatedScale).
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          mostrarCheck = true;
        });
      }
    });
  }

  // tempo estimado.
  int calcularTempoEntrega(double total) {
    if (total >= 150) {
      return 50;
    } else if (total >= 60) {
      return 40;
    } else {
      return 30;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedido Confirmado"),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animação simples: o ícone "cresce" de 0 até o tamanho normal.
              AnimatedScale(
                scale: mostrarCheck ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Pedido realizado com sucesso!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                "Forma de pagamento: ${widget.pagamento}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Total: R\$ ${widget.total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              // Resultado do processamento feito no initState.
              AnimatedOpacity(
                opacity: mostrarCheck ? 1 : 0,
                duration: const Duration(milliseconds: 700),
                child: Text(
                  "Tempo estimado de entrega: $tempoEntrega minutos",
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Volta pra tela de pedido, limpando o histórico de rotas.
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PedidoPage()),
                    (route) => false,
                  );
                },
                child: const Text("Fazer Novo Pedido"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
