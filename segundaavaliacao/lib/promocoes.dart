import 'package:flutter/material.dart';
import 'main.dart';
import 'card_promocoes.dart';

class PromocoesPage extends StatelessWidget {
  const PromocoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promoções 🍕"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.deepOrange,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Hero(
                tag: "pizzaHero",
                child: const Icon(
                  Icons.local_pizza,
                  size: 140,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const CardPromocao(
                titulo: "Terça da Pizza",
                descricao: "Na compra de uma pizza grande ganhe refrigerante.",
                icone: Icons.local_offer,
                cor: Colors.green,
              ),

              const CardPromocao(
                titulo: "Cupom",
                descricao: "Use DESCONTO10 e ganhe 10% OFF.",
                icone: Icons.discount,
                cor: Colors.blue,
              ),

              const CardPromocao(
                titulo: "Entrega",
                descricao: "Acima de R\$70 a entrega é grátis.",
                icone: Icons.delivery_dining,
                cor: Colors.red,
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepOrange,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text(
                    "Continuar Pedido",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PedidoPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
