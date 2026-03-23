import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/navbaregistro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'perfilpage_widget.dart' show PerfilpageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfilpageModel extends FlutterFlowModel<PerfilpageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? imagen;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataN1c = false;
  FFUploadedFile uploadedLocalFile_uploadDataN1c =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadData0nm = false;
  FFUploadedFile uploadedLocalFile_uploadData0nm =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData0nm = '';

  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for Apellidos widget.
  FocusNode? apellidosFocusNode;
  TextEditingController? apellidosTextController;
  String? Function(BuildContext, String?)? apellidosTextControllerValidator;
  // State field(s) for Telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for NickName widget.
  FocusNode? nickNameFocusNode;
  TextEditingController? nickNameTextController;
  String? Function(BuildContext, String?)? nickNameTextControllerValidator;
  // Model for navbaregistro component.
  late NavbaregistroModel navbaregistroModel;

  @override
  void initState(BuildContext context) {
    navbaregistroModel = createModel(context, () => NavbaregistroModel());
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    apellidosFocusNode?.dispose();
    apellidosTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    nickNameFocusNode?.dispose();
    nickNameTextController?.dispose();

    navbaregistroModel.dispose();
  }
}
