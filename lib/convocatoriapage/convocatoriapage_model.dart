import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'convocatoriapage_widget.dart' show ConvocatoriapageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConvocatoriapageModel extends FlutterFlowModel<ConvocatoriapageWidget> {
  ///  Local state fields for this page.

  List<int> convocado = [];
  void addToConvocado(int item) => convocado.add(item);
  void removeFromConvocado(int item) => convocado.remove(item);
  void removeAtIndexFromConvocado(int index) => convocado.removeAt(index);
  void insertAtIndexInConvocado(int index, int item) =>
      convocado.insert(index, item);
  void updateConvocadoAtIndex(int index, Function(int) updateFn) =>
      convocado[index] = updateFn(convocado[index]);

  List<int> convocadosdb = [];
  void addToConvocadosdb(int item) => convocadosdb.add(item);
  void removeFromConvocadosdb(int item) => convocadosdb.remove(item);
  void removeAtIndexFromConvocadosdb(int index) => convocadosdb.removeAt(index);
  void insertAtIndexInConvocadosdb(int index, int item) =>
      convocadosdb.insert(index, item);
  void updateConvocadosdbAtIndex(int index, Function(int) updateFn) =>
      convocadosdb[index] = updateFn(convocadosdb[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in convocatoriapage widget.
  List<ResultadosRow>? resultados;
  // Stores action output result for [Backend Call - Query Rows] action in convocatoriapage widget.
  List<JugadoresRow>? jugadoreslist;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<JugadoresRow>? falsos;
  // Model for navbarequipos component.
  late NavbarequiposModel navbarequiposModel;

  @override
  void initState(BuildContext context) {
    navbarequiposModel = createModel(context, () => NavbarequiposModel());
  }

  @override
  void dispose() {
    navbarequiposModel.dispose();
  }
}
