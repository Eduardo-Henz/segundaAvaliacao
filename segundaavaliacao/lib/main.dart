import 'package:flutter/material.dart';

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*debugShowCheckedModeBanner: false,*/
      home: PedidoPage(),
    );
  }
}

class PedidoPage extends StatefulWidget {
  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {

  String tamanho = "Média";
  bool borda = false;
  String bebida = "Coca-Cola";

  double total = 0;

  calcularTotal() {
    total = 0;

    if (tamanho == "Pequena") {
      total += 40;
    }

    if (tamanho == "Média") {
      total += 50;
    }

    if (tamanho == "Grande") {
      total += 150;
    }

    if (borda) {
      total += 10;
    }
    if (bebida == "Coca-Cola") {
      total += 10;
    }

    if (bebida == "Guaraná") {
      total += 12;
    }

    if (bebida == "Suco") {
      total += 8;
    }
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(" Dudu Pizzeria 🍕"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              "Escolha o tamanho:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile(
              title: Text("Pequena - RS:40,00"),
              value: "Pequena",
              groupValue: tamanho,

              onChanged: (value) {
                setState(() {
                  tamanho = value!;
                });
              },
            ),

            RadioListTile(
              title: Text("Média - RS:50,00"),
              value: "Média",
              groupValue: tamanho,

              onChanged: (value) {
                setState(() {
                  tamanho = value!;
                });
              },
            ),

            RadioListTile(
              title: Text("Grande - RS:150,00"),
              value: "Grande",
              groupValue: tamanho,

              onChanged: (value) {
                setState(() {
                  tamanho = value!;
                });
              },
            ),

            SizedBox(height: 10),

            CheckboxListTile(
              title: Text("Borda recheada (+10)"),
              value: borda,

              onChanged: (value) {
                setState(() {
                  borda = value!;
                });
              },
            ),

            SizedBox(height: 10),

            Text(
              "Escolha a bebida:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            DropdownButton(
              value: bebida,
              isExpanded: true,

              items: [
                DropdownMenuItem(
                  child: Text("Coca-Cola 2L - RS:10,00"),
                  value: "Coca-Cola",
                ),

                DropdownMenuItem(
                  child: Text("Guaraná 2L - RS:12,00"),
                  value: "Guaraná",
                ),

                DropdownMenuItem(
                  child: Text("Suco 1,5L - RS:8,00"),
                  value: "Suco",
                ),
              ],

              onChanged: (value) {
                setState(() {
                  bebida = value!;
                });
              },
            ),

            SizedBox(height: 20),

            Center(
              child: ElevatedButton(

                onPressed: () {

                  calcularTotal();

                
                },

                child: Text("Finalizar Pedido"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}