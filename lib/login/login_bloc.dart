import 'dart:async';
import 'package:br/carro/simple_bloc.dart';
import 'package:br/login/login_api.dart';
import 'package:br/login/usuario.dart';
import 'package:br/pages/api_response.dart';

class LoginBloc extends SimpleBloc<bool>{

  Future<ApiResponse<Usuario>> login(String login, String senha) async {

    add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    add(false);

    return response;

  }

}