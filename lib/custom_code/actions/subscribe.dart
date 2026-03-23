// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

Future<void> subscribe(
  String tableName,
  String
      primaryKeyColumn, // The name of your table's primary key column, e.g., 'id'
  Future<dynamic> Function() onDataChange,
) async {
  final supabase = SupaFlow.client;

  // First, cancel any existing subscription to avoid duplicates
  if (FFAppState().realtimeSubscription != null) {
    try {
      final StreamSubscription<dynamic> oldSubscription =
          FFAppState().realtimeSubscription;
      await oldSubscription.cancel();
      print('Cancelled existing subscription.');
    } catch (e) {
      print('Error cancelling old subscription: $e');
    }
  }

  // Define the stream using the modern .stream() method
  final stream =
      supabase.from(tableName).stream(primaryKey: [primaryKeyColumn]);

  // Listen to the stream of data
  final subscription = stream.listen((payload) {
    print('Change received: ${payload.toString()}');
    onDataChange();
  });

  // Store the new subscription in our App State variable
  FFAppState().update(() {
    FFAppState().realtimeSubscription = subscription;
  });

  print('Successfully subscribed to changes in $tableName.');
}
