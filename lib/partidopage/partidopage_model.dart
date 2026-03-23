import '/backend/supabase/supabase.dart';
import '/components/anulagol_widget.dart';
import '/components/gol_widget.dart';
import '/components/golno_amigo_widget.dart';
import '/components/navbarequipos_widget.dart';
import '/components/tarjeta_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'partidopage_widget.dart' show PartidopageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PartidopageModel extends FlutterFlowModel<PartidopageWidget> {
  ///  Local state fields for this page.

  int? parte;

  String contadorv = '00:00';

  DateTime? fechaInicio;

  int? ultimalparte;

  int? goleslocal;

  int? golesvisit;

  List<int> amarilla = [];
  void addToAmarilla(int item) => amarilla.add(item);
  void removeFromAmarilla(int item) => amarilla.remove(item);
  void removeAtIndexFromAmarilla(int index) => amarilla.removeAt(index);
  void insertAtIndexInAmarilla(int index, int item) =>
      amarilla.insert(index, item);
  void updateAmarillaAtIndex(int index, Function(int) updateFn) =>
      amarilla[index] = updateFn(amarilla[index]);

  List<int> roja = [];
  void addToRoja(int item) => roja.add(item);
  void removeFromRoja(int item) => roja.remove(item);
  void removeAtIndexFromRoja(int index) => roja.removeAt(index);
  void insertAtIndexInRoja(int index, int item) => roja.insert(index, item);
  void updateRojaAtIndex(int index, Function(int) updateFn) =>
      roja[index] = updateFn(roja[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in partidopage widget.
  List<ResultadosRow>? resultados;
  InstantTimer? actualizadorContador2;
  // Stores action output result for [Bottom Sheet - Anulagol] action in IconButton widget.
  int? goleslocalfinal;
  // Stores action output result for [Bottom Sheet - Gol] action in IconButton widget.
  int? abrebottom;
  // Stores action output result for [Bottom Sheet - GolnoAmigo] action in IconButton widget.
  int? abrenoamigo;
  // Stores action output result for [Bottom Sheet - Anulagol] action in IconButton widget.
  int? golesvisitfinal;
  // Stores action output result for [Bottom Sheet - Gol] action in IconButton widget.
  int? golvisit;
  // Stores action output result for [Bottom Sheet - GolnoAmigo] action in IconButton widget.
  int? abrenoamigo2;
  InstantTimer? actualizadorContador;
  InstantTimer? actualizadorContadorparte2;
  InstantTimer? actualizadorContadorparte3;
  InstantTimer? actualizadorContadorparte4;
  // Stores action output result for [Bottom Sheet - Tarjeta] action in Button widget.
  List<int>? listaamar;
  // Stores action output result for [Bottom Sheet - Tarjeta] action in Button widget.
  List<int>? tarjetaroja;
  // Model for navbarequipos component.
  late NavbarequiposModel navbarequiposModel;

  @override
  void initState(BuildContext context) {
    navbarequiposModel = createModel(context, () => NavbarequiposModel());
  }

  @override
  void dispose() {
    actualizadorContador2?.cancel();
    actualizadorContador?.cancel();
    actualizadorContadorparte2?.cancel();
    actualizadorContadorparte3?.cancel();
    actualizadorContadorparte4?.cancel();
    navbarequiposModel.dispose();
  }
}
