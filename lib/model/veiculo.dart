class Veiculo {
  final int? idVeiculo;
  final String placa;
  final String modelo;

  Veiculo({this.idVeiculo, required this.placa, required this.modelo});

  factory Veiculo.fromMap(Map<String, dynamic> dados) {
    return Veiculo(
      idVeiculo: dados['idveiculo'],
      placa: dados['placa'],
      modelo: dados['modelo'],
    );
  }
}
