import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _asistenciaentrenamiento = [];
  List<String> get asistenciaentrenamiento => _asistenciaentrenamiento;
  set asistenciaentrenamiento(List<String> value) {
    _asistenciaentrenamiento = value;
  }

  void addToAsistenciaentrenamiento(String value) {
    asistenciaentrenamiento.add(value);
  }

  void removeFromAsistenciaentrenamiento(String value) {
    asistenciaentrenamiento.remove(value);
  }

  void removeAtIndexFromAsistenciaentrenamiento(int index) {
    asistenciaentrenamiento.removeAt(index);
  }

  void updateAsistenciaentrenamientoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    asistenciaentrenamiento[index] = updateFn(_asistenciaentrenamiento[index]);
  }

  void insertAtIndexInAsistenciaentrenamiento(int index, String value) {
    asistenciaentrenamiento.insert(index, value);
  }

  dynamic _realtimeSubscription;
  dynamic get realtimeSubscription => _realtimeSubscription;
  set realtimeSubscription(dynamic value) {
    _realtimeSubscription = value;
  }

  int _userid = 0;
  int get userid => _userid;
  set userid(int value) {
    _userid = value;
  }

  int _notifpend = 0;
  int get notifpend => _notifpend;
  set notifpend(int value) {
    _notifpend = value;
  }
}
