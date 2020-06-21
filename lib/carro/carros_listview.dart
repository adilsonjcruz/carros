import 'package:br/carro/carro.dart';
import 'package:br/carro/carros_api.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatefulWidget {

  String tipo;

  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView> with AutomaticKeepAliveClientMixin<CarrosListView>{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {

    Future<List<Carro>> future = CarrosApi.getCarros(widget.tipo);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot){

        if(snapshot.hasError){
          return Center(
            child: Text(
                "Não foi possível buscar os carros",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                )
            ),
          );
        }

        if(! snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        List<Carro> carros = snapshot.data;
        return _listView(carros);

      },
    );

  }

  Container _listView(List<Carro> carros) {

    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(

          itemCount: carros != null ? carros.length : 0,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return Card(
              color: Colors.grey[200],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto ?? "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Ferrari_FF.png",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome ?? "Carro Genérico",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      "descrição...",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () { /* ... */ },
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () { /* ... */ },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

          }),
    );
  }
}
