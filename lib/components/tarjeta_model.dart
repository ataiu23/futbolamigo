import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'tarjeta_widget.dart' show TarjetaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TarjetaModel extends FlutterFlowModel<TarjetaWidget> {
  ///  Local state fields for this component.

  int? jugadorseleccionado;

  String? nombre;

  int? marclocal;

  int? marvisit;

  List<int> listaamarilla = [];
  void addToListaamarilla(int item) => listaamarilla.add(item);
  void removeFromListaamarilla(int item) => listaamarilla.remove(item);
  void removeAtIndexFromListaamarilla(int index) =>
      listaamarilla.removeAt(index);
  void insertAtIndexInListaamarilla(int index, int item) =>
      listaamarilla.insert(index, item);
  void updateListaamarillaAtIndex(int index, Function(int) updateFn) =>
      listaamarilla[index] = updateFn(listaamarilla[index]);

  List<int> listaroja = [];
  void addToListaroja(int item) => listaroja.add(item);
  void removeFromListaroja(int item) => listaroja.remove(item);
  void removeAtIndexFromListaroja(int index) => listaroja.removeAt(index);
  void insertAtIndexInListaroja(int index, int item) =>
      listaroja.insert(index, item);
  void updateListarojaAtIndex(int index, Function(int) updateFn) =>
      listaroja[index] = updateFn(listaroja[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
