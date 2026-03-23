// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<int>> notificationsadmins(List<int> listaselecc) async {
  // 1. Obtenemos el cliente de Supabase
  final supabase = Supabase.instance.client;

  // 2. Hacemos la consulta pidiendo solo la columna 'id'
  // .overlaps busca coincidencias entre los dos arrays
  final response = await supabase
      .from(
          'Datos Usuarios') // Asegúrate que el nombre sea idéntico en Supabase
      .select('id')
      .overlaps('jugador_admin', listaselecc);

  // 3. Convertimos la respuesta en una lista de Integers limpia
  // La respuesta viene como una lista de mapas: [{'id': 1}, {'id': 5}]
  return (response as List<dynamic>).map((item) => item['id'] as int).toList();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
