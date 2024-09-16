import 'package:flutter/material.dart';

class MenuPrincipal extends StatelessWidget{
  
  MenuPrincipal({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Principal', 
          style: TextStyle(color: Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.bold)),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 350,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 35),
              child: const Image(image: AssetImage('./assets/logoCompleto.png'))),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 200,
            height: 65,
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
            child: TextButton(onPressed: (){
              Navigator.of(context).pushNamed('/inventory');
            }, child: const Text('Inventario', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 200,
            height: 65,
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
            child: TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/kits');
            }, child: const Text('Kits', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 200,
            height: 65,
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
            child: TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/workers');
            }, child: const Text('Operarios', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 200,
            height: 65,
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
            child: TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/');
            }, child: const Text('Cerrar Sesión', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
        ],
      )),
    );
  }
}