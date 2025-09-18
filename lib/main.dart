import 'package:flutter/material.dart';
import 'package:persistencia_sqlite/veiculo_list_page.dart';
import 'package:persistencia_sqlite/veiculo_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Veiculos',
      home: VeiculoListPage(),
    ),
  );
}
