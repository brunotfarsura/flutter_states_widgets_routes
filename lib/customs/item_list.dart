import 'package:flutter/material.dart';

Widget getPWAOption = const Card(
    child: ListTile(
      leading: Icon(Icons.phone_forwarded),
      title: Text("Ionic"),
      subtitle: Text("Linguagens Javascript e Typescript"),
    ),
);

Widget getItemList(String title, String subtitle, IconData iconData){
  return Card(
    child: ListTile(
      leading: Icon(iconData), //verificar o valor caso nulo.
      title: Text(title),
      subtitle: Text(subtitle),
    ),
  );
}