import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/navbarehome1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<DatosUsuariosRow>? actualuser;
  // Model for navbarehome1 component.
  late Navbarehome1Model navbarehome1Model;

  @override
  void initState(BuildContext context) {
    navbarehome1Model = createModel(context, () => Navbarehome1Model());
  }

  @override
  void dispose() {
    navbarehome1Model.dispose();
  }
}
