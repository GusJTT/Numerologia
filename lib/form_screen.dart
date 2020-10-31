import 'package:flutter/material.dart';
import 'package:nuevo/inicio.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _nombre;
  String _apellidos;
  String _anio;
  String _mes;
  String _dia;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNombre() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo requerido';
        }
        if (!RegExp(r"[:alpha:]*[ ][:alpha:]*").hasMatch(value)) {
          return 'Ingrese un nombre correcto';
        }
        return null;
      },
      onSaved: (String value) {
        _nombre = value;
      },
    );
  }

  Widget _buildApellidos() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Apellidos'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo requerido';
        }
        if (!RegExp(r"[:alpha:]*[ ][:alpha:]*").hasMatch(value)) {
          return 'Ingrese valores correctos';
        }
        return null;
      },
      onSaved: (String value) {
        _apellidos = value;
      },
    );
  }

  Widget _buildNacimientoAnio() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Año de nacimiento'),
      maxLength: 4,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo requerido';
        }
        if (!RegExp(r"[1800-2020]").hasMatch(value)) {
          return 'Ingrese una fecha correcta';
        }
        return null;
      },
      onSaved: (String value) {
        _anio = value;
      },
    );
  }

  Widget _buildNacimientoMes() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Mes de nacimiento'),
      maxLength: 2,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo requerido';
        }
        if (!RegExp(r"[1]?[1-2]?").hasMatch(value)) {
          return 'Ingrese una fecha correcta';
        }
        return null;
      },
      onSaved: (String value) {
        _mes = value;
      },
    );
  }

  Widget _buildNacimientoDia() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dia de nacimiento'),
      maxLength: 2,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo requerido';
        }
        if (!RegExp(r"[1-3]?[1-9]?").hasMatch(value)) {
          return 'Ingrese una fecha correcta';
        }
        return null;
      },
      onSaved: (String value) {
        _dia = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Estudio numerológico")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNombre(),
              _buildApellidos(),
              _buildNacimientoAnio(),
              _buildNacimientoMes(),
              _buildNacimientoDia(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PantallaInicio(_nombre,_apellidos,_anio,_mes,_dia),
                  ));
                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}