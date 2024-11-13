import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,

                  validator: (value) {
                    
                    if (value!.isEmpty) {
                      return "El nombre es requerido";
                    }
                    if(value.length < 3) {
                      return "El nombre debe tener al menos 3 caracteres";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    labelStyle: TextStyle(color: Colors.blue[800]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.blue[800]),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El correo es requerido";
                    }
                    if(value.length < 8) {
                      return "El password debe tener al menos 8 caracteres";
                    }
                    if(value.length > 12) {
                      return "El password debe tener menos de 12 caracteres";
                    }
                    if(!value.contains("@")) {
                      return "El password debe contener un @";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Formulario validado");

                      }else{
                        print("Formulario no validado");
                      }
                    },
                    child: Text("Enviar"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
