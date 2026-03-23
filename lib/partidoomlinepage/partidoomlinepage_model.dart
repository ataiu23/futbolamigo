import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'partidoomlinepage_widget.dart' show PartidoomlinepageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PartidoomlinepageModel extends FlutterFlowModel<PartidoomlinepageWidget> {
  ///  Local state fields for this page.

  DateTime? fechainicio;

  String? contadorv = '--:--:--';

  int? parte;

  ///  State fields for stateful widgets in this page.

  Completer<List<ResultadosRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in partidoomlinepage widget.
  List<ResultadosRow>? resultados;
  InstantTimer? actualizadorContador2;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for navbarequipos component.
  late NavbarequiposModel navbarequiposModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    listViewController = ScrollController();
    navbarequiposModel = createModel(context, () => NavbarequiposModel());
  }

  @override
  void dispose() {
    actualizadorContador2?.cancel();
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    listViewController?.dispose();
    navbarequiposModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
