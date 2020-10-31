import 'dart:math';
import 'package:flutter/material.dart';

class PantallaInicio extends StatefulWidget {
  String nombre;
  String apellidos;
  String anio;
  String mes;
  String dia;

  PantallaInicio(this.nombre,this.apellidos,this.anio,this.mes,this.dia);
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    int urgencia = Urgencia(int.parse(widget.anio),int.parse(widget.mes),int.parse(widget.dia));
    int tonica = Tonica(widget.nombre,widget.apellidos,urgencia);
    int tonicaDia = TonicaDia(now.day,now.month,now.year,tonica);
    int acont = AcontecimientoDia(now.day,now.month,now.year,tonica);
    String cabala = CabalaAnio(int.parse(widget.anio));
    var rng = new Random();
    int hora = rng.nextInt(12)+1;
    return Scaffold(
        appBar: AppBar(title: Text("Resultados del Estudio")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Text("Nombre: "+widget.nombre+"\n"+
            "Apellidos: "+widget.apellidos+"\n"+
            "Dia: "+widget.dia+"\n"+
            "Mes: "+widget.mes+"\n"+
            "Año: "+widget.anio+"\n"+
            "Urgencia interior: "+urgencia.toString()+"\n"+
            "Tónica fundamental: "+tonica.toString()+"\n"+
            "Tónica del dia: " +tonicaDia.toString()+"\n"+
            "Acontecimiento del dia : " +hora.toString()+"\n"+
            "Cabala del año: \n"+ cabala),
      ),
    );
  }
}
int SumarDigitos(int numero){
  int resultado = 0;
  while(numero > 0){
    resultado += numero % 10;
    numero = (numero / 10).toInt();
  }
  return resultado;
}
int Urgencia(int anio, int mes, int dia){
  int urgencia = SumarDigitos(anio) + SumarDigitos(mes) + SumarDigitos(dia);
  while(urgencia >= 10){
    urgencia = SumarDigitos(urgencia);
  }
  return urgencia;
}

int Tonica(String nombre, String apellidos, int urgencia){
  int tonicaNum = nombre.replaceAll(" ","").length + apellidos.replaceAll(" ","").length;
  while(tonicaNum >= 10){
    tonicaNum = SumarDigitos(tonicaNum);
  }
  tonicaNum = tonicaNum + urgencia;
  while(tonicaNum >= 10){
    tonicaNum = SumarDigitos(tonicaNum);
  }
  return tonicaNum;
}
//Día 30 de Abril de 1969
int TonicaDia(int dia, int mes, int anio, tonica){
  int tonicad = SumarDigitos(dia) + SumarDigitos(mes) + SumarDigitos(anio);
  while(tonicad >= 10){
    tonicad = SumarDigitos(tonicad);
  }
  tonicad = tonicad + tonica;
  while(tonicad >= 10){
    tonicad = SumarDigitos(tonicad);
  }
  return tonicad;
}

int AcontecimientoDia(int dia, int mes, int anio, int tonicaFun){
  int acontecimiento = SumarDigitos(dia) + SumarDigitos(mes) + SumarDigitos(anio);
  while(acontecimiento >= 10){
    acontecimiento = SumarDigitos(acontecimiento);
  }
  acontecimiento = acontecimiento + tonicaFun;
  while(acontecimiento >= 10){
    acontecimiento = SumarDigitos(acontecimiento);
  }
  var rng = new Random();
  int hora = rng.nextInt(12)+1;
  print(hora);
  acontecimiento = acontecimiento + hora;
  while(acontecimiento >= 10){
    acontecimiento = SumarDigitos(acontecimiento);
  }
  return acontecimiento;
}
int anio1, anio2, anio3, anio4, anio5;
int reg1, reg2, reg3, reg4, reg5, reg6;
String CabalaAnio(int nac){
  String cabalaAnio;
  reg1 = SumarDigitos(nac);
  anio1 = nac + reg1;
  while(reg1 >= 10){
    reg1 = SumarDigitos(reg1);
  }
  reg2 = SumarDigitos(anio1);
  anio2 = anio1 + reg2;
  while(reg2 >= 10){
    reg2 = SumarDigitos(reg2);
  }
  reg3 = SumarDigitos(anio2);
  anio3 = anio2 + reg3;
  while(reg3 >= 10){
    reg3 = SumarDigitos(reg3);
  }
  reg4 = SumarDigitos(anio3);
  anio4 = anio3 + reg4;
  while(reg4 >= 10){
    reg4 = SumarDigitos(reg4);
  }
  reg5 = SumarDigitos(anio4);
  anio5 = anio4 + reg5;
  while(reg5 >= 10){
    reg5 = SumarDigitos(reg5);
  }
  reg6 = SumarDigitos(anio5);
  while(reg6 >= 10){
    reg6 = SumarDigitos(reg6);
  }
  cabalaAnio="   Año: "+anio1.toString()+", numero regente: "+ reg2.toString() + "\n"+
      "   Año: "+anio2.toString()+", numero regente: "+ reg3.toString()+"\n"+
      "   Año: "+anio3.toString()+", numero regente: "+ reg4.toString()+"\n"+
      "   Año: "+anio4.toString()+", numero regente: "+ reg5.toString()+"\n"+
      "   Año: "+anio5.toString()+", numero regente: "+ reg6.toString();
  return cabalaAnio;
}