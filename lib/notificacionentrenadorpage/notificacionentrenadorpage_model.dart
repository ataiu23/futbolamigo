import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/navbarnotificaciones_widget.dart';
import '/components/seleccionjugadores_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'notificacionentrenadorpage_widget.dart'
    show NotificacionentrenadorpageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificacionentrenadorpageModel
    extends FlutterFlowModel<NotificacionentrenadorpageWidget> {
  ///  Local state fields for this page.

  List<int> jugadorsel = [];
  void addToJugadorsel(int item) => jugadorsel.add(item);
  void removeFromJugadorsel(int item) => jugadorsel.remove(item);
  void removeAtIndexFromJugadorsel(int index) => jugadorsel.removeAt(index);
  void insertAtIndexInJugadorsel(int index, int item) =>
      jugadorsel.insert(index, item);
  void updateJugadorselAtIndex(int index, Function(int) updateFn) =>
      jugadorsel[index] = updateFn(jugadorsel[index]);

  String? adjuntotipo;

  FFUploadedFile? adjunto;

  List<int> jugsdest = [];
  void addToJugsdest(int item) => jugsdest.add(item);
  void removeFromJugsdest(int item) => jugsdest.remove(item);
  void removeAtIndexFromJugsdest(int index) => jugsdest.removeAt(index);
  void insertAtIndexInJugsdest(int index, int item) =>
      jugsdest.insert(index, item);
  void updateJugsdestAtIndex(int index, Function(int) updateFn) =>
      jugsdest[index] = updateFn(jugsdest[index]);

  String? imagen;

  bool? pdf;

  String? pdfname;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - seleccionjugadores] action in Button widget.
  List<int>? outputcomponenteCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading_uploadedPDFnot = false;
  FFUploadedFile uploadedLocalFile_uploadedPDFnot =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_imgNotif = false;
  FFUploadedFile uploadedLocalFile_imgNotif =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadimgNotif = false;
  FFUploadedFile uploadedLocalFile_uploadimgNotif =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadimgNotif = '';

  // Stores action output result for [Custom Action - notificationsadmins] action in buttonimagen widget.
  List<int>? idsdest;
  // Stores action output result for [Custom Action - notificationsadmins] action in buttonimagen widget.
  List<int>? idsdestfalse;
  bool isDataUploading_uploadpdfNotif = false;
  FFUploadedFile uploadedLocalFile_uploadpdfNotif =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadpdfNotif = '';

  // Stores action output result for [Custom Action - notificationsadmins] action in Buttonpdf widget.
  List<int>? idsdestCopy;
  // Stores action output result for [Custom Action - notificationsadmins] action in Buttontext widget.
  List<int>? idsdestfalseCopy;
  // Model for navbarnotificaciones component.
  late NavbarnotificacionesModel navbarnotificacionesModel;

  @override
  void initState(BuildContext context) {
    navbarnotificacionesModel =
        createModel(context, () => NavbarnotificacionesModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    navbarnotificacionesModel.dispose();
  }
}
