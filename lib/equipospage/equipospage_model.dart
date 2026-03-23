import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'equipospage_widget.dart' show EquipospageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EquipospageModel extends FlutterFlowModel<EquipospageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in equipospage widget.
  List<EquiposRow>? listae;
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
