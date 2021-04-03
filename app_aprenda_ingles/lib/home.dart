import 'package:flutter/material.dart';
import 'package:app_aprenda_ingles/tabs/bichos_page.dart';
import 'package:app_aprenda_ingles/tabs/numeros_page.dart';
import 'package:app_aprenda_ingles/tabs/vogais_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aprenda Inglês"),
        //backgroundColor: Colors.brown,
        bottom: TabBar(
          indicatorWeight: 4,
          //indicatorColor: Colors.white,
          //labelColor: Colors.white,
          //unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Bichos",
            ),
            Tab(
              text: "Números",
            ),
            Tab(
              text: "Vogais",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[Bichos(), Numeros(), Vogais()],
      ),
    );
  }
}
