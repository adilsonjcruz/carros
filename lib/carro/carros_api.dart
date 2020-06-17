import 'package:br/carro/carro.dart';

class CarrosApi{

  static List<Carro> getCarros(){

    final carros = List<Carro>();

    carros.add(Carro(nome: "Ferrari FF 2", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Ferrari_FF.png"));
    carros.add(Carro(nome: "AUDI GT Spyder", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Audi_Spyder.png"));
    carros.add(Carro(nome: "Porsche Panamera", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Porsche_Panamera.png"));

    return carros;

  }

}