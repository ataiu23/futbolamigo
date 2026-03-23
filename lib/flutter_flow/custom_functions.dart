import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? formatearTiempoTranscurrido(DateTime fechaInicio) {
  // Obtiene la fecha y hora actual
  final ahora = DateTime.now();

  // Calcula la diferencia entre AHORA y la fecha de INICIO
  final Duration duracion = ahora.difference(fechaInicio);

  // Si por alguna razón la fecha de inicio es en el futuro, la duración será negativa.
  // En ese caso, mostramos 00:00 como valor seguro.
  if (duracion.isNegative) {
    return "00:00";
  }

  // Extrae los minutos TOTALES y los segundos restantes.
  // A diferencia de antes, ahora usamos .inMinutes directamente para que el contador
  // pueda pasar de 59 minutos (ej: 60, 61, 62...).
  String minutos = duracion.inMinutes.toString().padLeft(2, '0');

  // Los segundos se calculan igual, siempre como el resto de 60.
  String segundos = duracion.inSeconds.remainder(60).toString().padLeft(2, '0');

  return "$minutos:$segundos";
}
