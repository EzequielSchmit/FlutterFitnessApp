import 'package:fitness_app/util/utilities.dart';
import 'package:fitness_app/pages/meal_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio", style: Estilos.titleStyle.copyWith(fontSize: 28,)),
        centerTitle: true,
        toolbarHeight: 80 ,
        backgroundColor: Colors.blueAccent[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
        ),
        width: double.infinity,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("¿Qué querés comer?",
              style: Estilos.sectionTitleStyle.copyWith(
                fontSize: 22,
              ),
            ),
            SizedBox(height: 50,),
            _getBotonDeComida(context, comida: CategoriasComida.desayuno),
            _getBotonDeComida(context, comida: CategoriasComida.comidaPrincipal),
            _getBotonDeComida(context, comida: CategoriasComida.snack),
            
          ],
        ),
      ),
    );
  }

  void abrirPaginaDeComida(BuildContext context, CategoriasComida comida){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => MealPage(comida: comida),),
    );
  }

  TextButton _getBotonDeComida(BuildContext context, {required CategoriasComida comida, bool estaHabilitado = true}){
    return TextButton(
      onPressed: estaHabilitado? ()=>abrirPaginaDeComida(context, comida) : null,
      child: Container(
        decoration: BoxDecoration(
          color: estaHabilitado? Colors.blue[100] : Colors.grey[100],
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: 150,
        child: Text(
          comida.nombreFormateado,
          style: Estilos.sectionTitleStyle.copyWith(
            color: estaHabilitado? Colors.blue[900] : Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}
