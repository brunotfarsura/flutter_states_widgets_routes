import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';

class AddLanguage extends StatelessWidget {
  AddLanguage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(16);
    return Scaffold(
      appBar: AppBar(title: const Text("Nova Linguagem")),
      body: Padding(
        padding: padding,
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Digite a linguagem",
                labelText: "Digite a linguagem"
              ),
              controller: _titleController,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Insira o nome da linguagem";
                }
                return null;
              }),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Digite a descrição",
                labelText: "Digite a descrição"
              ),
              controller: _subTitleController,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Insira a descrição";
                }
                return null;
              }),
              Padding(padding: padding,
              child: ElevatedButton(
                child: const Text("Gravar"),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Language language = Language(_titleController.text, _subTitleController.text);
                    Navigator.pop(context, language);
                  }
                }
              ))
          ]),
        )
    ));
  }
}