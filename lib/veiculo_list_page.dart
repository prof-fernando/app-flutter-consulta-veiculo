import 'package:flutter/material.dart';
import 'package:persistencia_sqlite/database_helper.dart';
import 'package:persistencia_sqlite/model/veiculo.dart';

class VeiculoListPage extends StatefulWidget {
  const VeiculoListPage({super.key});

  @override
  State<VeiculoListPage> createState() => _VeiculoListPageState();
}

class _VeiculoListPageState extends State<VeiculoListPage> {
  final DatabaseHelper _db = DatabaseHelper();
  List<Veiculo> _veiculos = [];

  @override
  void initState() {
    super.initState();
    // fazer a busca
    _loadData();
  }

  _loadData() async {
    final lista = await _db.buscarTodos();
    setState(() {
      _veiculos = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de veiculos'),
      ),
      body: ListView.builder(
        itemCount: _veiculos.length,

        itemBuilder: (_, index) {
          if (_veiculos.length == 0) {
            return Text("Nenhum veiculo encontrado");
          }

          Veiculo v = _veiculos[index];

          return ListTile(
            title: Text(v.modelo),
            subtitle: Text(v.placa),
            leading: Text(v.idVeiculo.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    await _db.delete(v);
                    _loadData();
                  },
                  icon: Icon(Icons.clear),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
