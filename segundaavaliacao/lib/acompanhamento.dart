import 'package:flutter/material.dart';

class AcompanhamentoPage extends StatefulWidget {
  const AcompanhamentoPage({super.key});

  @override
  State<AcompanhamentoPage> createState() => _AcompanhamentoPageState();
}

class _AcompanhamentoPageState extends State<AcompanhamentoPage>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(1.5, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget etapa(String texto, IconData icone, Color cor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icone,
          color: cor,
        ),
        title: Text(
          texto,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Acompanhamento"),
        backgroundColor: Colors.deepOrange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 20),

            SlideTransition(
              position: animation,
              child: const Icon(
                Icons.delivery_dining,
                size: 90,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 30),

            etapa(
              "Pedido Recebido",
              Icons.check_circle,
              Colors.green,
            ),

            etapa(
              "Preparando Pizza",
              Icons.local_pizza,
              Colors.orange,
            ),

            etapa(
              "Saiu para Entrega",
              Icons.delivery_dining,
              Colors.blue,
            ),

            etapa(
              "Entregue",
              Icons.home,
              Colors.green,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {

                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );

                },
                icon: const Icon(Icons.home),
                label: const Text(
                  "Voltar ao Início",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}