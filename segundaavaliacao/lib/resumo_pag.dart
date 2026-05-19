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
              child: ElevatedButton(

                onPressed: () {

                  showDialog(
                    context: context,

                    builder: (context) {

                      return AlertDialog(

                        title: Text("Pedido Confirmado"),

                        content: Text(
                          "Pagamento: $pagamento",
                        ),

                        actions: [

                          TextButton(

                            onPressed: () {
                              Navigator.pop(context);
                            },

                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },

                child: Text("Confirmar Pagamento"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}