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
        backgroundColor: Colores.colorAppBar,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colores.colorBgScaffold,
        ),
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
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
                    _getBotonDeComida(context, comida: ComidasDelDia.desayuno),
                    _getBotonDeComida(context, comida: ComidasDelDia.comidaPrincipal),
                    _getBotonDeComida(context, comida: ComidasDelDia.snack),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  void abrirPaginaDeComida(BuildContext context, ComidasDelDia comida){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => MealPage(comida: comida),),
    );
  }

  TextButton _getBotonDeComida(BuildContext context, {required ComidasDelDia comida, bool estaHabilitado = true}){
    return TextButton(
      onPressed: estaHabilitado? ()=>abrirPaginaDeComida(context, comida) : null,
      child: Container(
        decoration: BoxDecoration(
          color: estaHabilitado? Colores.colorBotonHabilitado : Colores.colorBotonDeshabilitado,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: 150,
        child: Text(
          comida.nombreFormateado,
          style: Estilos.sectionTitleStyle.copyWith(
            color: estaHabilitado? Colores.colorTextoBotonHabilitado : Colores.colorTextoBotonDeshabilitado,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}
