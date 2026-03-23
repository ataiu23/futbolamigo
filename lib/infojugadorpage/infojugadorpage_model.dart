import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'infojugadorpage_widget.dart' show InfojugadorpageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class InfojugadorpageModel extends FlutterFlowModel<InfojugadorpageWidget> {
  ///  Local state fields for this page.

  List<int> puntual = [];
  void addToPuntual(int item) => puntual.add(item);
  void removeFromPuntual(int item) => puntual.remove(item);
  void removeAtIndexFromPuntual(int index) => puntual.removeAt(index);
  void insertAtIndexInPuntual(int index, int item) =>
      puntual.insert(index, item);
  void updatePuntualAtIndex(int index, Function(int) updateFn) =>
      puntual[index] = updateFn(puntual[index]);

  List<int> retraso = [];
  void addToRetraso(int item) => retraso.add(item);
  void removeFromRetraso(int item) => retraso.remove(item);
  void removeAtIndexFromRetraso(int index) => retraso.removeAt(index);
  void insertAtIndexInRetraso(int index, int item) =>
      retraso.insert(index, item);
  void updateRetrasoAtIndex(int index, Function(int) updateFn) =>
      retraso[index] = updateFn(retraso[index]);

  List<int> ausencia = [];
  void addToAusencia(int item) => ausencia.add(item);
  void removeFromAusencia(int item) => ausencia.remove(item);
  void removeAtIndexFromAusencia(int index) => ausencia.removeAt(index);
  void insertAtIndexInAusencia(int index, int item) =>
      ausencia.insert(index, item);
  void updateAusenciaAtIndex(int index, Function(int) updateFn) =>
      ausencia[index] = updateFn(ausencia[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Switch widget.
  List<JugadoresRow>? swich;
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
