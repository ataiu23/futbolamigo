// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CalendarioMultiSimple extends StatefulWidget {
  const CalendarioMultiSimple({
    super.key,
    this.width,
    this.height,
    this.fechaSeleccionada,
    this.fechaNoSeleccionada,
    this.fechasInicialesParam,
  });

  final double? width;
  final double? height;
  final Future<dynamic> Function(DateTime fecha)? fechaSeleccionada;
  final Future<dynamic> Function(DateTime fecha)? fechaNoSeleccionada;
  final List<DateTime>? fechasInicialesParam;

  @override
  State<CalendarioMultiSimple> createState() => _CalendarioMultiSimpleState();
}

class _CalendarioMultiSimpleState extends State<CalendarioMultiSimple> {
  // --- CAMBIO DE LÓGICA DE ESTADO ---
  // En lugar de una lista, ahora solo guardamos una única fecha nueva (o ninguna).
  // El '?' significa que puede ser nula (ninguna seleccionada).
  DateTime? _fechaNuevaSeleccionada;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> fechasIniciales = widget.fechasInicialesParam ?? [];

    // La lista total de fechas activas ahora se construye de forma diferente.
    final List<DateTime?> fechasActivas = [...fechasIniciales];
    if (_fechaNuevaSeleccionada != null) {
      // Si hay una fecha nueva seleccionada, la añadimos a la lista.
      fechasActivas.add(_fechaNuevaSeleccionada);
    }

    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.multi,
      selectedDayHighlightColor: Colors.indigo,
      weekdayLabels: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
      firstDayOfWeek: 1,
      dayBuilder: ({
        required DateTime date,
        TextStyle? textStyle,
        BoxDecoration? decoration,
        bool? isSelected,
        bool? isDisabled,
        bool? isToday,
      }) {
        // La lógica del 'dayBuilder' ahora comprueba contra la única fecha nueva.
        final esLaFechaNuevaSeleccionada = _fechaNuevaSeleccionada != null &&
            DateUtils.isSameDay(_fechaNuevaSeleccionada!, date);

        if (isSelected == true && esLaFechaNuevaSeleccionada) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: textStyle?.copyWith(color: Colors.white),
              ),
            ),
          );
        }
        return null;
      },
    );

    return Container(
      width: widget.width,
      height: widget.height,
      child: CalendarDatePicker2(
        config: config,
        value: fechasActivas,
        onValueChanged: (nuevasFechas) {
          final fechaClicada = _findChangedDate(fechasActivas, nuevasFechas);
          if (fechaClicada == null) return;

          final esFechaInicial =
              fechasIniciales.any((d) => DateUtils.isSameDay(d, fechaClicada));

          setState(() {
            if (esFechaInicial) {
              // El comportamiento para fechas iniciales no cambia.
              if (widget.fechaSeleccionada != null) {
                widget.fechaSeleccionada!(fechaClicada);
              }
            } else {
              // --- NUEVA LÓGICA PARA FECHAS NO INICIALES ---

              // Comprobamos si la fecha pulsada es la que ya estaba seleccionada.
              if (_fechaNuevaSeleccionada != null &&
                  DateUtils.isSameDay(fechaClicada, _fechaNuevaSeleccionada!)) {
                // Si es la misma, la deseleccionamos (la ponemos a null).
                _fechaNuevaSeleccionada = null;
              } else {
                // Si es una fecha diferente (o no había ninguna seleccionada),
                // la establecemos como la nueva fecha seleccionada, reemplazando la anterior.
                _fechaNuevaSeleccionada = fechaClicada;
                // Y actualizamos el estado de la página con esta nueva fecha.
                if (widget.fechaNoSeleccionada != null) {
                  widget.fechaNoSeleccionada!(fechaClicada);
                }
              }
            }
          });
        },
      ),
    );
  }

  DateTime? _findChangedDate(List<DateTime?> oldList, List<DateTime?> newList) {
    final oldSet = oldList.whereType<DateTime>().toSet();
    final newSet = newList.whereType<DateTime>().toSet();

    if (newSet.length > oldSet.length) {
      for (final date in newSet) {
        if (!oldSet.contains(date)) {
          return date;
        }
      }
    } else if (oldSet.length > newSet.length) {
      for (final date in oldSet) {
        if (!newSet.contains(date)) {
          return date;
        }
      }
    }
    return null;
  }
}
