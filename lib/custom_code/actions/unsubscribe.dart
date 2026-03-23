// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

Future<void> unsubscribe() async {
  if (FFAppState().realtimeSubscription != null) {
    try {
      // The object in App State is the StreamSubscription, we need to cast it
      final StreamSubscription<dynamic> subscription =
          FFAppState().realtimeSubscription;
      await subscription.cancel();
      print('Realtime subscription cancelled successfully.');

      // Clear the variable from App State
      FFAppState().update(() {
        FFAppState().realtimeSubscription = null;
      });
    } catch (e) {
      print('Error unsubscribing: $e');
    }
  } else {
    print('No active subscription found to cancel.');
  }
}
