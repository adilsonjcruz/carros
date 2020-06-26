import 'package:br/carro/carros_api.dart';
import 'package:br/carro/carros_listview.dart';
import 'package:br/utils/prefs.dart';
import 'package:br/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  _initTabs() async {
    int tabIdx = await Prefs.getInt("tabIdx");

    _tabController = TabController(length: 3, vsync: this);

    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: _tabController == null
            ? null
            : TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: "Classicos",
                  ),
                  Tab(
                    text: "Esportivos",
                  ),
                  Tab(
                    text: "Luxo",
                  ),
                ],
              ),
      ),
      body: _tabController == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TabBarView(controller: _tabController, children: [
              CarrosListView(TipoCarro.classicos),
              CarrosListView(TipoCarro.esportivos),
              CarrosListView(TipoCarro.luxo),
            ]),
      drawer: DrawerList(),
    );
  }
}
