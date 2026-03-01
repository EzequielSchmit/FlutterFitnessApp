import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyBar(),
      body: Text("Prueba 1", style: TextStyle(fontSize: 14),),
    );
  }
}

class MyBar extends StatelessWidget implements PreferredSizeWidget{
  const MyBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Text("Desayuno",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    
      leading: GestureDetector(
        onTap: (){
        },
        child: MySvgButton("assets/icons/Arrow - Left 2.svg", 20, 20),
      ),
    
      actions: [
        GestureDetector(
          onTap: (){
          },
          child: MySvgButton("assets/icons/dots.svg", 5, 5),
        ),
      ],

      
    
    );
  }
}

class MySvgButton extends StatelessWidget {
  String path;
  double width, height;
  MySvgButton(this.path, this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        path,
        height: height,
        width: width,
      ),          
    );
  }
}