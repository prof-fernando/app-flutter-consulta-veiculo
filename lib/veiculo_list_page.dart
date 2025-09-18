import 'package:flutter/material.dart';

class VeiculoListPage extends StatefulWidget {
  const VeiculoListPage({super.key});

  @override
  State<VeiculoListPage> createState() => _VeiculoListPageState();
}

class _VeiculoListPageState extends State<VeiculoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de veiculos'),
      ),
      body: Text('fazer mais tarde'),
    );
  }
}
