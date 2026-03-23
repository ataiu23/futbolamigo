import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'entrenamientopage_widget.dart' show EntrenamientopageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EntrenamientopageModel extends FlutterFlowModel<EntrenamientopageWidget> {
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

  int gol1 = 0;

  int gol2 = 0;

  int gol3 = 0;

  int gol4 = 0;

  int gol5 = 0;

  int pase1 = 0;

  int pase2 = 0;

  int pase3 = 0;

  int pase4 = 0;

  int pase5 = 0;

  int conoderribado = 0;

  int? golestotal = 0;

  int? jugselgol;

  int? jugselpase;

  int? jugselvel;

  int? jugselreg;

  int? pasestotal = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Timer widget.
  final timerInitialTimeMs1 = 0;
  int timerMilliseconds1 = 0;
  String timerValue1 = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
  );
  FlutterFlowTimerController timerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for Timer widget.
  final timerInitialTimeMs2 = 0;
  int timerMilliseconds2 = 0;
  String timerValue2 = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
  );
  FlutterFlowTimerController timerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Model for navbarequipos component.
  late NavbarequiposModel navbarequiposModel;

  @override
  void initState(BuildContext context) {
    navbarequiposModel = createModel(context, () => NavbarequiposModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    timerController1.dispose();
    timerController2.dispose();
    navbarequiposModel.dispose();
  }
}
