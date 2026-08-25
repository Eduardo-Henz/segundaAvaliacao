class PedidoModel {
  int? id;
  String tamanho;
  String borda;
  String bebida;
  String sabor;
  int quantidade;
  double total;
  String pagamento;
  String status;
  String data;

  PedidoModel({
    this.id,
    required this.tamanho,
    required this.borda,
    required this.bebida,
    required this.sabor,
    required this.quantidade,
    required this.total,
    required this.pagamento,
    this.status = "Pedido Recebido",
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tamanho': tamanho,
      'borda': borda,
      'bebida': bebida,
      'sabor': sabor,
      'quantidade': quantidade,
      'total': total,
      'pagamento': pagamento,
      'status': status,
      'data': data,
    };
  }

  factory PedidoModel.fromMap(Map<String, dynamic> map) {
    return PedidoModel(
      id: map['id'],
      tamanho: map['tamanho'],
      borda: map['borda'],
      bebida: map['bebida'],
      sabor: map['sabor'],
      quantidade: map['quantidade'],
      total: map['total'],
      pagamento: map['pagamento'],
      status: map['status'],
      data: map['data'],
    );
  }
}