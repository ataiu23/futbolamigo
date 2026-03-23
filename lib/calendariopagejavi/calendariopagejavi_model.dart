import '/backend/supabase/supabase.dart';
import '/components/editarpartido_escritura_widget.dart';
import '/components/editarpartido_lectura_widget.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'calendariopagejavi_widget.dart' show CalendariopagejaviWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendariopagejaviModel
    extends FlutterFlowModel<CalendariopagejaviWidget> {
  ///  Local state fields for this page.

  List<DateTime> fechasas = [];
  void addToFechasas(DateTime item) => fechasas.add(item);
  void removeFromFechasas(DateTime item) => fechasas.remove(item);
  void removeAtIndexFromFechasas(int index) => fechasas.removeAt(index);
  void insertAtIndexInFechasas(int index, DateTime item) =>
      fechasas.insert(index, item);
  void updateFechasasAtIndex(int index, Function(DateTime) updateFn) =>
      fechasas[index] = updateFn(fechasas[index]);

  DateTime? fechaPulsada;

  DateTime? fechaPulsadaLibre;

  int? idpartido;

  bool? federacion;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in calendariopagejavi widget.
  List<ResultadosRow>? fff;
  // Model for editarpartidoLectura component.
  late EditarpartidoLecturaModel editarpartidoLecturaModel;
  // Model for editarpartidoEscritura component.
  late EditarpartidoEscrituraModel editarpartidoEscrituraModel;
  // Model for navbarequipos component.
  late NavbarequiposModel navbarequiposModel;

  @override
  void initState(BuildContext context) {
    editarpartidoLecturaModel =
        createModel(context, () => EditarpartidoLecturaModel());
    editarpartidoEscrituraModel =
        createModel(context, () => EditarpartidoEscrituraModel());
    navbarequiposModel = createModel(context, () => NavbarequiposModel());
  }

  @override
  void dispose() {
    editarpartidoLecturaModel.dispose();
    editarpartidoEscrituraModel.dispose();
    navbarequiposModel.dispose();
  }
}
