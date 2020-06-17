import 'package:br/login/usuario.dart';
import 'package:br/pages/api_response.dart';
import 'package:br/carro/home_page.dart';
import 'package:br/utils/alert.dart';
import 'package:br/utils/nav.dart';
import 'package:br/widgets/app_button.dart';
import 'package:br/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'login_api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "Login",
              "Digite o Login",
              controller: _tLogin,
              validator: validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "Digite a Senha",
              password: true,
              controller: _tSenha,
              validator: validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
                    "Login",
                    onPressed:
                    _onClickLogin,
                    showProgress: _showProgress,),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok) {
      Usuario user = response.result;

      print(">>> $response");
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }

    setState(() {
      _showProgress = false;
    });

  }

  String validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o Login!";
    }
    return null;
  }

  String validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a Senha!";
    }
    if (text.length < 3) {
      return "A senha precisa ter no mínimo 3 caracteres!";
    }
    return null;
  }
}
