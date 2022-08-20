import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/customs/item_list.dart';
import 'package:flutter_states_widgets_routes/models/language.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screens/AddLanguage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      initialRoute: "/home",
      routes: {
        "/home" : (context) => const MyHomePage(),
        "/add" : (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<bool> selects = [false,false,false,false,false,false];

List<Language> languages = [
  Language("Android Nativo", "Linguagens C, Java, Kotlin"),
  Language("Ionic", "Linguagens Javascript e Typescript"),
  Language("iOS Nativo", "Linguagens Objective-C e Swift"),
  Language("Flutter", "Linguagem DART"),
  Language("React Native", "Linguagens Javascript e Typescript"),
  Language("Ionic", "Linguagens Javascript e Typescript"),
];

  List<Widget> buildChoices(){
    return languages.map((language) => ChoiceChip(
      label: Text(language.title),
      selected: language.selected,
      onSelected: (value) {
        setState(() {
          language.selected = value;
        });
      }
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escolha de linguagens"),
        actions: [
          IconButton(
            onPressed: _goToNewLanguage,
            icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10,
            children: buildChoices(),
          ),
          Expanded(child: 
            ListView(children: buildListItens())
          )
        ],
      )
    );
  }

  void _goToNewLanguage(){
    Future future = Navigator.pushNamed(context, "/add");
    future.then((language) => {
      setState((){
        languages.add(language);
      })
    });
  }

   List<Widget> buildListItens(){
  return languages.where((language) => language.selected)
          .map((language) => getItemList(language.title, language.subtitle,
          language.icon != null ? language.icon! : Icons.blur_circular))
          .toList();
}

//final Widget reactSvg = SvgPicture.asset('images/react.svg');

}
