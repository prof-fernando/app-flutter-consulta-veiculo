import 'package:flutter/material.dart';
import 'package:persistencia_sqlite/database_helper.dart';

class VeiculoPage extends StatefulWidget {
  const VeiculoPage({super.key});

  @override
  State<VeiculoPage> createState() => _VeiculoPageState();
}

class _VeiculoPageState extends State<VeiculoPage> {
  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () async {
          print('c;icou');
          int id = await _db.gravar('abc-1234', 'fusca');
          print('od gerado $id');
        },
        child: Text('Salvar'),
      ),
    );
  }
}
