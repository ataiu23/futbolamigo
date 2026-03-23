import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'seleccionjugadores_widget.dart' show SeleccionjugadoresWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeleccionjugadoresModel
    extends FlutterFlowModel<SeleccionjugadoresWidget> {
  ///  Local state fields for this component.

  List<int> jugadoresseleccionados = [];
  void addToJugadoresseleccionados(int item) =>
      jugadoresseleccionados.add(item);
  void removeFromJugadoresseleccionados(int item) =>
      jugadoresseleccionados.remove(item);
  void removeAtIndexFromJugadoresseleccionados(int index) =>
      jugadoresseleccionados.removeAt(index);
  void insertAtIndexInJugadoresseleccionados(int index, int item) =>
      jugadoresseleccionados.insert(index, item);
  void updateJugadoresseleccionadosAtIndex(int index, Function(int) updateFn) =>
      jugadoresseleccionados[index] = updateFn(jugadoresseleccionados[index]);

  List<int> jugadorescomponente = [];
  void addToJugadorescomponente(int item) => jugadorescomponente.add(item);
  void removeFromJugadorescomponente(int item) =>
      jugadorescomponente.remove(item);
  void removeAtIndexFromJugadorescomponente(int index) =>
      jugadorescomponente.removeAt(index);
  void insertAtIndexInJugadorescomponente(int index, int item) =>
      jugadorescomponente.insert(index, item);
  void updateJugadorescomponenteAtIndex(int index, Function(int) updateFn) =>
      jugadorescomponente[index] = updateFn(jugadorescomponente[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in seleccionjugadores widget.
  List<JugadoresRow>? jugstotal;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
