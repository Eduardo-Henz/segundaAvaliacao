import 'package:flutter/material.dart';
import 'resumo_pag.dart';
import 'login.dart';

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
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

  int quantidade = 1;

  TextEditingController cupomController = TextEditingController();

  double desconto = 0;
  double entrega = 8;

  void calcularTotal() {

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

  if (borda != "Nenhuma") {
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

  total *= quantidade;

  desconto = 0;

  if (cupomController.text.toUpperCase() == "DESCONTO10") {
    desconto = total * 0.10;
  }

  total -= desconto;

  entrega = total >= 70 ? 0 : 8;

  total += entrega;
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(" Dudu Pizzeria 🍕"),
      ),

      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Center(
              child: Hero(
                tag: "pizzaHero",
                child: AnimatedRotation(
                  turns: tamanho == "Grande"
                        ? 1
                       : tamanho == "Média"
                       ? 0.5
                       : 0,
                  duration: const Duration(milliseconds: 500),
                  child: const Icon(
                    Icons.local_pizza,
                    size: 140,
                    color: Colors.deepOrange,
                    ),
                ),
              ),
            ),

          const SizedBox(height: 20),

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

            Text(
              "Escolha a borda:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

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
              },
            ),
            SizedBox(height: 10),

                    Text(
            "Escolha o sabor:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

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


          const SizedBox(height: 20),

Text(
  "Quantidade",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    IconButton(
      onPressed: () {
        if (quantidade > 1) {
          setState(() {
            quantidade--;
          });
        }
      },
      icon: Icon(Icons.remove_circle, color: Colors.red, size: 35),
    ),

         Text(
           quantidade.toString(),
           style: TextStyle(
             fontSize: 24,
             fontWeight: FontWeight.bold,
           ),
         ),

         IconButton(
           onPressed: () {
             setState(() {
               quantidade++;
             });
           },
           icon: Icon(Icons.add_circle, color: Colors.green, size: 35),
         ),
       ],
     ),

     TextField(
       controller: cupomController,
       decoration: InputDecoration(
         labelText: "Cupom de desconto",
         hintText: "DESCONTO10",
         border: OutlineInputBorder(),
         prefixIcon: Icon(Icons.discount),
       ),
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
              },
            ),

            SizedBox(height: 20),

        const SizedBox(height: 20),

Center(
  child: ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
    ),
    onPressed: () {
      setState(() {
        calcularTotal();
      });
    },
    icon: const Icon(Icons.calculate),
    label: const Text("Calcular Total"),
  ),
),

const SizedBox(height: 20),

Center(
  child: Card(
    elevation: 8,
    color: Colors.orange.shade100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          Text(
            "Quantidade: $quantidade",
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 5),

          Text(
            "Entrega: R\$ ${entrega.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 5),

          Text(
            "Desconto: R\$ ${desconto.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18),
          ),

          const Divider(),

          Text(
            "TOTAL",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Text(
            "R\$ ${total.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    ),
  ),
),

          Center(
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {

            setState(() {
              calcularTotal();
            });

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
          icon: const Icon(Icons.shopping_cart_checkout),
          label: const Text(
            "Finalizar Pedido",
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
    )
    );
  }
}
