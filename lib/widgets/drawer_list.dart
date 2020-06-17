import 'package:br/login/login_page.dart';
import 'package:br/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("Adilson Cruz"),
                  accountEmail: Text("adilsonjcruz@live.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("http://icons.iconarchive.com/icons/diversity-avatars/avatars/256/batman-icon.png")//AssetImage("assets/images/img3.jpg"),
                  )),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("Mais informações..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("Item 1...");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                subtitle: Text("Mais informações..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("Item 2...");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => _onClickLogout(context),
              )
            ],
          ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }

}
