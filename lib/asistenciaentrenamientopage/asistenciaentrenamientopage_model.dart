import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'asistenciaentrenamientopage_widget.dart'
    show AsistenciaentrenamientopageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AsistenciaentrenamientopageModel
    extends FlutterFlowModel<AsistenciaentrenamientopageWidget> {
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

  // Stores action output result for [Backend Call - Query Rows] action in asistenciaentrenamientopage widget.
  List<JugadoresRow>? nomequip;
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
