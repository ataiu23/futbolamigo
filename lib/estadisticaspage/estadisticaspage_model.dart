import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'estadisticaspage_widget.dart' show EstadisticaspageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EstadisticaspageModel extends FlutterFlowModel<EstadisticaspageWidget> {
  ///  Local state fields for this page.

  List<int> pases = [];
  void addToPases(int item) => pases.add(item);
  void removeFromPases(int item) => pases.remove(item);
  void removeAtIndexFromPases(int index) => pases.removeAt(index);
  void insertAtIndexInPases(int index, int item) => pases.insert(index, item);
  void updatePasesAtIndex(int index, Function(int) updateFn) =>
      pases[index] = updateFn(pases[index]);

  List<String> fechapase = [];
  void addToFechapase(String item) => fechapase.add(item);
  void removeFromFechapase(String item) => fechapase.remove(item);
  void removeAtIndexFromFechapase(int index) => fechapase.removeAt(index);
  void insertAtIndexInFechapase(int index, String item) =>
      fechapase.insert(index, item);
  void updateFechapaseAtIndex(int index, Function(String) updateFn) =>
      fechapase[index] = updateFn(fechapase[index]);

  int? anchograficopases = 290;

  List<int> tiro = [];
  void addToTiro(int item) => tiro.add(item);
  void removeFromTiro(int item) => tiro.remove(item);
  void removeAtIndexFromTiro(int index) => tiro.removeAt(index);
  void insertAtIndexInTiro(int index, int item) => tiro.insert(index, item);
  void updateTiroAtIndex(int index, Function(int) updateFn) =>
      tiro[index] = updateFn(tiro[index]);

  List<String> fechatiro = [];
  void addToFechatiro(String item) => fechatiro.add(item);
  void removeFromFechatiro(String item) => fechatiro.remove(item);
  void removeAtIndexFromFechatiro(int index) => fechatiro.removeAt(index);
  void insertAtIndexInFechatiro(int index, String item) =>
      fechatiro.insert(index, item);
  void updateFechatiroAtIndex(int index, Function(String) updateFn) =>
      fechatiro[index] = updateFn(fechatiro[index]);

  int? anchograficotiro = 290;

  List<double> velocidad = [];
  void addToVelocidad(double item) => velocidad.add(item);
  void removeFromVelocidad(double item) => velocidad.remove(item);
  void removeAtIndexFromVelocidad(int index) => velocidad.removeAt(index);
  void insertAtIndexInVelocidad(int index, double item) =>
      velocidad.insert(index, item);
  void updateVelocidadAtIndex(int index, Function(double) updateFn) =>
      velocidad[index] = updateFn(velocidad[index]);

  List<String> fechavelocidad = [];
  void addToFechavelocidad(String item) => fechavelocidad.add(item);
  void removeFromFechavelocidad(String item) => fechavelocidad.remove(item);
  void removeAtIndexFromFechavelocidad(int index) =>
      fechavelocidad.removeAt(index);
  void insertAtIndexInFechavelocidad(int index, String item) =>
      fechavelocidad.insert(index, item);
  void updateFechavelocidadAtIndex(int index, Function(String) updateFn) =>
      fechavelocidad[index] = updateFn(fechavelocidad[index]);

  int? anchograficovelocidad = 290;

  List<double> regate = [];
  void addToRegate(double item) => regate.add(item);
  void removeFromRegate(double item) => regate.remove(item);
  void removeAtIndexFromRegate(int index) => regate.removeAt(index);
  void insertAtIndexInRegate(int index, double item) =>
      regate.insert(index, item);
  void updateRegateAtIndex(int index, Function(double) updateFn) =>
      regate[index] = updateFn(regate[index]);

  List<String> fecharegate = [];
  void addToFecharegate(String item) => fecharegate.add(item);
  void removeFromFecharegate(String item) => fecharegate.remove(item);
  void removeAtIndexFromFecharegate(int index) => fecharegate.removeAt(index);
  void insertAtIndexInFecharegate(int index, String item) =>
      fecharegate.insert(index, item);
  void updateFecharegateAtIndex(int index, Function(String) updateFn) =>
      fecharegate[index] = updateFn(fecharegate[index]);

  int? anchograficoregate = 290;

  List<double> indicePases = [];
  List<double> indiceTiro = [];
  List<double> indiceVelocidad = [];
  List<double> indiceRegate = [];

  List<double> fechasPasesDouble = [];
  List<double> fechasTiroDouble = [];
  List<double> fechasVelocidadDouble = [];
  List<double> fechasRegateDouble = [];

  List<int> conotirado = [];
  void addToConotirado(int item) => conotirado.add(item);
  void removeFromConotirado(int item) => conotirado.remove(item);
  void removeAtIndexFromConotirado(int index) => conotirado.removeAt(index);
  void insertAtIndexInConotirado(int index, int item) =>
      conotirado.insert(index, item);
  void updateConotiradoAtIndex(int index, Function(int) updateFn) =>
      conotirado[index] = updateFn(conotirado[index]);

  List<double> regatetotal = [];
  void addToRegatetotal(double item) => regatetotal.add(item);
  void removeFromRegatetotal(double item) => regatetotal.remove(item);
  void removeAtIndexFromRegatetotal(int index) => regatetotal.removeAt(index);
  void insertAtIndexInRegatetotal(int index, double item) =>
      regatetotal.insert(index, item);
  void updateRegatetotalAtIndex(int index, Function(double) updateFn) =>
      regatetotal[index] = updateFn(regatetotal[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in estadisticaspage widget.
  List<EntrenamientosRow>? respuestaEntrenamientos;
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
