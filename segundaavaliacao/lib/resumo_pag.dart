import 'package:flutter/material.dart';

class ResumoPage extends StatefulWidget {

  final String tamanho;
  final String borda;
  final String bebida;
  final double total;

  ResumoPage({
    required this.tamanho,
    required this.borda,
    required this.bebida,
    required this.total,
  });

  @override
  State<ResumoPage> createState() => _ResumoPageState();
}

class _ResumoPageState extends State<ResumoPage> {

  String pagamento = "Pix";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Resumo do Pedido"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              "Resumo do Pedido",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Tamanho: ${widget.tamanho}",
              style: TextStyle(fontSize: 20),
            ),

            Text(
              "Borda: ${widget.borda}",
              style: TextStyle(fontSize: 20),
            ),

            Text(
              "Bebida: ${widget.bebida}",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            Text(
              "Total: RS ${widget.total.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),

            Text(
              "Forma de pagamento",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            DropdownButton(
              value: pagamento,
              isExpanded: true,

              items: [

                DropdownMenuItem(
                  child: Text("Pix"),
                  value: "Pix",
                ),

                DropdownMenuItem(
                  child: Text("Cartão"),
                  value: "Cartão",
                ),

                DropdownMenuItem(
                  child: Text("Dinheiro"),
                  value: "Dinheiro",
                ),
              ],

              onChanged: (value) {

                setState(() {
                  pagamento = value!;
                });
              },
            ),

            SizedBox(height: 30),

            Center(
  child: SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 10),
                  Text("Pedido Confirmado"),
                ],
              ),
              content: Text(
                "Pagamento: $pagamento\n\nSeu pedido foi recebido com sucesso! 🍕",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.payment),
      label: const Text(
        "Confirmar Pagamento",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}