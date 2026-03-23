import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'editarpartido_escritura_widget.dart' show EditarpartidoEscrituraWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarpartidoEscrituraModel
    extends FlutterFlowModel<EditarpartidoEscrituraWidget> {
  ///  Local state fields for this component.

  String? localselected;

  String? visitanteselected;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in editarpartidoEscritura widget.
  List<ClubsRow>? listaclubs;
  DateTime? datePicked;
  // State field(s) for local widget.
  String? localValue;
  FormFieldController<String>? localValueController;
  // State field(s) for visitante widget.
  String? visitanteValue;
  FormFieldController<String>? visitanteValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
