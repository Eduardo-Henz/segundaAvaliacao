import 'package:flutter/material.dart';
import 'main.dart';

class PromocoesPage extends StatelessWidget {
  const PromocoesPage({super.key});

  Widget cardPromocao(
      String titulo, String descricao, IconData icone, Color cor) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          icone,
          color: cor,
          size: 40,
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
                child: Icon(
                  Icons.local_pizza,
                  size: 140,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              cardPromocao(
                "Terça da Pizza",
                "Na compra de uma pizza grande ganhe refrigerante.",
                Icons.local_offer,
                Colors.green,
              ),

              cardPromocao(
                "Cupom",
                "Use DESCONTO10 e ganhe 10% OFF.",
                Icons.discount,
                Colors.blue,
              ),

              cardPromocao(
                "Entrega",
                "Acima de R\$70 a entrega é grátis.",
                Icons.delivery_dining,
                Colors.red,
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PedidoPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "FAZER PEDIDO",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}