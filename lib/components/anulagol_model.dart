import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'anulagol_widget.dart' show AnulagolWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnulagolModel extends FlutterFlowModel<AnulagolWidget> {
  ///  Local state fields for this component.

  int? jugadorseleccionado;

  String? nombre;

  int? marclocal;

  int? marvisit;

  String? ultimogolequipo;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Anulagol widget.
  List<EventosPartidoRow>? ultimogol;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ResultadosRow>? goleslocalfinal;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ResultadosRow>? golesvisitfinal;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
