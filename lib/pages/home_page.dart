import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/segunda_Pag.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenidos a mi app')),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/logo1.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/whatsapp.png',
                width: 60.0,
              ),
              Image.asset(
                'assets/fb.png',
                width: 30.0,
              ),
              Image.asset(
                'assets/ig.png',
                width: 30.0,
              ),
            ],
          )
        ],
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Aqui va a ir una imagen'),
            ),
            ListTile(
              title: Center(child: Text('Juegos gratis')),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              child: RaisedButton(
                child: Text('Consumir API'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                },
              ),
            ),
            ListTile(
              title: Center(child: Text('Contactanos')),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
