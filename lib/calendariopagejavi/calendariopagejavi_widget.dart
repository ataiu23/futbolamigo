import '/backend/supabase/supabase.dart';
import '/components/editarpartido_escritura_widget.dart';
import '/components/editarpartido_lectura_widget.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendariopagejavi_model.dart';
export 'calendariopagejavi_model.dart';

class CalendariopagejaviWidget extends StatefulWidget {
  const CalendariopagejaviWidget({
    super.key,
    required this.nobreequipo,
    required this.listaequipo,
  });

  final String? nobreequipo;
  final int? listaequipo;

  static String routeName = 'calendariopagejavi';
  static String routePath = '/calendariopagejavi';

  @override
  State<CalendariopagejaviWidget> createState() =>
      _CalendariopagejaviWidgetState();
}

class _CalendariopagejaviWidgetState extends State<CalendariopagejaviWidget> {
  late CalendariopagejaviModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendariopagejaviModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fff = await ResultadosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_equipo',
          widget!.listaequipo,
        ),
      );
      _model.fechasas = _model.fff!
          .map((e) => e.fecha)
          .withoutNulls
          .toList()
          .toList()
          .cast<DateTime>();
      _model.federacion = false;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ResultadosRow>>(
      future: ResultadosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_equipo',
          widget!.listaequipo,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ResultadosRow> calendariopagejaviResultadosRowList =
            snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/sing_in.webp',
                            ).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 60.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 100.0),
                                        child: Container(
                                          width: 340.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.76,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Calendario de Partidos',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 28.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 0.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 3.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.87,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.33,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9F2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 5.0,
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: custom_widgets
                                                            .CalendarioMultiSimple(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fechasInicialesParam:
                                                              _model.fechasas,
                                                          fechaSeleccionada:
                                                              (fecha) async {
                                                            _model.fechaPulsada =
                                                                fecha;
                                                            _model.fechaPulsadaLibre =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          fechaNoSeleccionada:
                                                              (fecha) async {
                                                            _model.fechaPulsadaLibre =
                                                                fecha;
                                                            _model.fechaPulsada =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.fechaPulsada != null)
                                                  wrapWithModel(
                                                    model: _model
                                                        .editarpartidoLecturaModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        EditarpartidoLecturaWidget(
                                                      competicion: calendariopagejaviResultadosRowList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  e.fecha) ==
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .fechaPulsada))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.competicion,
                                                      equipolocal: calendariopagejaviResultadosRowList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  e.fecha) ==
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .fechaPulsada))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.clubLocal,
                                                      fotolocal: calendariopagejaviResultadosRowList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  e.fecha) ==
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .fechaPulsada))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.iogoclubLocal,
                                                      equipovisitante:
                                                          calendariopagejaviResultadosRowList
                                                              .where((e) =>
                                                                  dateTimeFormat(
                                                                      "d/M/y",
                                                                      e
                                                                          .fecha) ==
                                                                  dateTimeFormat(
                                                                      "d/M/y",
                                                                      _model
                                                                          .fechaPulsada))
                                                              .toList()
                                                              .firstOrNull
                                                              ?.clubVisitante,
                                                      fotovisitante: calendariopagejaviResultadosRowList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  e.fecha) ==
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .fechaPulsada))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.logoclubVisitante,
                                                      fecha: calendariopagejaviResultadosRowList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  e.fecha) ==
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .fechaPulsada))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.fecha,
                                                      hora: calendariopagejaviResultadosRowList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  e.fecha) ==
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .fechaPulsada))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.hora
                                                          ?.time,
                                                      idpartido: calendariopagejaviResultadosRowList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  e.fecha) ==
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .fechaPulsada))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.id,
                                                      federacion:
                                                          calendariopagejaviResultadosRowList
                                                              .where((e) =>
                                                                  e.fecha ==
                                                                  _model
                                                                      .fechaPulsada)
                                                              .toList()
                                                               .firstOrNull
                                                               ?.federacion,
                                                       onPartidoActualizado: () async {
                                                         _model.fff = await ResultadosTable().queryRows(
                                                           queryFn: (q) => q.eqOrNull(
                                                             'id_equipo',
                                                             widget!.listaequipo,
                                                           ),
                                                         );
                                                         _model.fechasas = _model.fff!
                                                             .map((e) => e.fecha)
                                                             .withoutNulls
                                                             .toList()
                                                             .toList()
                                                             .cast<DateTime>();
                                                         safeSetState(() {});
                                                       },
                                                     ),
                                                   ),
                                                if (_model.fechaPulsadaLibre !=
                                                    null)
                                                  wrapWithModel(
                                                    model: _model
                                                        .editarpartidoEscrituraModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        EditarpartidoEscrituraWidget(
                                                      fecha: _model
                                                          .fechaPulsadaLibre,
                                                      idequipo:
                                                          widget!.listaequipo,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navbarequiposModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavbarequiposWidget(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
