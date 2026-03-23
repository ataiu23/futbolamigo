import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/navbarnotificaciones_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'notificacionpage_widget.dart' show NotificacionpageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class NotificacionpageModel extends FlutterFlowModel<NotificacionpageWidget> {
  ///  Local state fields for this page.

  List<int> usuario = [];
  void addToUsuario(int item) => usuario.add(item);
  void removeFromUsuario(int item) => usuario.remove(item);
  void removeAtIndexFromUsuario(int index) => usuario.removeAt(index);
  void insertAtIndexInUsuario(int index, int item) =>
      usuario.insert(index, item);
  void updateUsuarioAtIndex(int index, Function(int) updateFn) =>
      usuario[index] = updateFn(usuario[index]);

  int? idnotif;

  ///  State fields for stateful widgets in this page.

  // Model for navbarnotificaciones component.
  late NavbarnotificacionesModel navbarnotificacionesModel;

  @override
  void initState(BuildContext context) {
    navbarnotificacionesModel =
        createModel(context, () => NavbarnotificacionesModel());
  }

  @override
  void dispose() {
    navbarnotificacionesModel.dispose();
  }
}
