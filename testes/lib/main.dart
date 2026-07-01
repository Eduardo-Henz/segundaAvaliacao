import 'package:flutter/material.dart';
import 'resumo_pag.dart';
import 'login.dart';
import 'widgets.dart';

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class PedidoPage extends StatefulWidget {
  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {

  String tamanho = "";
  String borda = "Nenhuma";
  String bebida = "Nenhuma";
  String sabor = "Calabresa";

  double total = 0;

  // Processamento continua aqui, dentro do StatefulWidget, porque o
  // resultado (total) muda o estado da tela via setState.
  void calcularTotal() {
    double novoTotal = 0;

    if (tamanho == "Pequena") {
      novoTotal += 40;
    }

    if (tamanho == "Média") {
      novoTotal += 50;
    }

    if (tamanho == "Grande") {
      novoTotal += 150;
    }

    if (borda != "Nenhuma") {
      novoTotal += 10;
    }
    if (bebida == "Coca-Cola") {
      novoTotal += 10;
    }

    if (bebida == "Guaraná") {
      novoTotal += 12;
    }

    if (bebida == "Suco") {
      novoTotal += 8;
    }

    setState(() {
      total = novoTotal;
    });
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

            SectionTitle("Escolha o tamanho:"),

            RadioListTile(
              title: Text("Pequena - RS:40,00"),
              value: "Pequena",
              groupValue: tamanho,

              onChanged: (value) {
                setState(() {
                  tamanho = value!;
                });
                calcularTotal();
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
                calcularTotal();
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
                calcularTotal();
              },
            ),

            SectionTitle("Escolha a borda:"),

             DropdownButton(
              value: borda,
              isExpanded: true,

              items: [

                 DropdownMenuItem(
                  child: Text("Nenhuma"),
                  value: "Nenhuma",
                ),

                DropdownMenuItem(
                  child: Text("Chocolate Preto"),
                  value: "Chocolate Preto",
                ),

                DropdownMenuItem(
                  child: Text("Chocolate Branco"),
                  value: "Chocolate Branco",
                ),

                DropdownMenuItem(
                  child: Text("Creme de Avelã"),
                  value: "Creme de Avelã",
                ),

                DropdownMenuItem(
                  child: Text("Catupiry"),
                  value: "Catupiry",
                ),

                DropdownMenuItem(
                  child: Text("Cheddar"),
                  value: "Cheddar",
                ),

                DropdownMenuItem(
                  child: Text("Cream Cheese"),
                  value: "Cream Cheese",
                ),
              ],

              onChanged: (value) {
                setState(() {
                  borda = value!;
                });
                calcularTotal();
              },
            ),

            SectionTitle("Escolha o sabor:"),

          DropdownButton(
            value: sabor,
            isExpanded: true,

            items: [

              DropdownMenuItem(
                child: Text("Calabresa"),
                value: "Calabresa",
              ),

              DropdownMenuItem(
                child: Text("Frango com Catupiry"),
                value: "Frango com Catupiry",
              ),

              DropdownMenuItem(
                child: Text("4 Queijos"),
                value: "4 Queijos",
              ),

              DropdownMenuItem(
                child: Text("Portuguesa"),
                value: "Portuguesa",
              ),

              DropdownMenuItem(
                child: Text("Chocolate"),
                value: "Chocolate",
              ),
            ],

            onChanged: (value) {
              setState(() {
                sabor = value!;
              });
            },
          ),

            SectionTitle("Escolha a bebida:"),

            DropdownButton(
              value: bebida,
              isExpanded: true,

              items: [

                 DropdownMenuItem(
                  child: Text("Nenhuma"),
                  value: "Nenhuma",
                ),

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
                calcularTotal();
              },
            ),

            SizedBox(height: 10),

            // O total é recalculado a cada escolha (setState acima) e essa
            // troca de valor é animada com AnimatedSwitcher.
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  "Total: RS ${total.toStringAsFixed(2)}",
                  key: ValueKey(total),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

      Center(
      child: ElevatedButton(

      onPressed: () {

        Navigator.push(

            context,

              MaterialPageRoute(

                builder: (context) => ResumoPage(

                tamanho: tamanho,
                borda: borda,
                bebida: bebida,
                total: total,
              ),
            ),
          );
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
