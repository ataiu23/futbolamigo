import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'asistenciaentrenamientopage_model.dart';
export 'asistenciaentrenamientopage_model.dart';

class AsistenciaentrenamientopageWidget extends StatefulWidget {
  const AsistenciaentrenamientopageWidget({
    super.key,
    required this.listaequipo,
    required this.nombreequipo,
  });

  final int? listaequipo;
  final String? nombreequipo;

  static String routeName = 'asistenciaentrenamientopage';
  static String routePath = '/asistenciaentrenamientopage';

  @override
  State<AsistenciaentrenamientopageWidget> createState() =>
      _AsistenciaentrenamientopageWidgetState();
}

class _AsistenciaentrenamientopageWidgetState
    extends State<AsistenciaentrenamientopageWidget> {
  late AsistenciaentrenamientopageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsistenciaentrenamientopageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.nomequip = await JugadoresTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'idequipo_jugador',
          widget!.listaequipo,
        ),
      );
      _model.puntual =
          _model.nomequip!.map((e) => e.id).toList().toList().cast<int>();
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
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isSmallScreen = screenWidth < 414;
    final equipoFontSize = isSmallScreen ? 26.0 : 20.0;

    return FutureBuilder<List<JugadoresRow>>(
      future: JugadoresTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'idequipo_jugador',
          widget!.listaequipo,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<JugadoresRow> asistenciaentrenamientopageJugadoresRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/sing_in.webp',
                              ).image,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 100.0),
                              child: Container(
                                width: 340.0,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(30.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 100.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final asistenciaentrenamientopageVar =
                                                              asistenciaentrenamientopageJugadoresRowList
                                                                  .toList();

                                                          return Wrap(
                                                            spacing: 10.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: List.generate(
                                                                asistenciaentrenamientopageVar
                                                                    .length,
                                                                (asistenciaentrenamientopageVarIndex) {
                                                              final asistenciaentrenamientopageVarItem =
                                                                  asistenciaentrenamientopageVar[
                                                                      asistenciaentrenamientopageVarIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            6.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (_model
                                                                        .puntual
                                                                        .contains(asistenciaentrenamientopageVarItem
                                                                            .id)) {
                                                                      _model.removeFromPuntual(
                                                                          asistenciaentrenamientopageVarItem
                                                                              .id);
                                                                      _model.addToRetraso(
                                                                          asistenciaentrenamientopageVarItem
                                                                              .id);
                                                                      safeSetState(
                                                                          () {});
                                                                    } else if (_model
                                                                        .retraso
                                                                        .contains(asistenciaentrenamientopageVarItem
                                                                            .id)) {
                                                                      _model.removeFromRetraso(
                                                                          asistenciaentrenamientopageVarItem
                                                                              .id);
                                                                      _model.addToAusencia(
                                                                          asistenciaentrenamientopageVarItem
                                                                              .id);
                                                                      safeSetState(
                                                                          () {});
                                                                    } else if (_model
                                                                        .ausencia
                                                                        .contains(
                                                                            asistenciaentrenamientopageVarItem.id)) {
                                                                      _model.removeFromAusencia(
                                                                          asistenciaentrenamientopageVarItem
                                                                              .id);
                                                                      _model.addToPuntual(
                                                                          asistenciaentrenamientopageVarItem
                                                                              .id);
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model.addToPuntual(
                                                                          asistenciaentrenamientopageVarItem
                                                                              .id);
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        1.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(24.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          99.2,
                                                                      height:
                                                                          137.71,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            () {
                                                                          if (_model.puntual.contains(asistenciaentrenamientopageVarItem
                                                                              .id)) {
                                                                            return Color(0xFFA7ECE4);
                                                                          } else if (_model.retraso.contains(asistenciaentrenamientopageVarItem
                                                                              .id)) {
                                                                            return Color(0xFFF1FDAB);
                                                                          } else if (_model
                                                                              .ausencia
                                                                              .contains(asistenciaentrenamientopageVarItem.id)) {
                                                                            return Color(0xFFFFBFC4);
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).secondaryText;
                                                                          }
                                                                        }(),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(24.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              () {
                                                                            if (_model.puntual.contains(asistenciaentrenamientopageVarItem.id)) {
                                                                              return Color(0xFF6BCEAF);
                                                                            } else if (_model.retraso.contains(asistenciaentrenamientopageVarItem.id)) {
                                                                              return Color(0xFFD3E753);
                                                                            } else if (_model.ausencia.contains(asistenciaentrenamientopageVarItem.id)) {
                                                                              return Color(0xFFF83A47);
                                                                            } else {
                                                                              return FlutterFlowTheme.of(context).secondaryText;
                                                                            }
                                                                          }(),
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(24.0),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  asistenciaentrenamientopageVarItem.fotoJugador,
                                                                                  'https://ataiu.com/futbol/jugadores/fotos/nofoto.webp',
                                                                                ),
                                                                                width: 65.8,
                                                                                height: 81.1,
                                                                                fit: BoxFit.cover,
                                                                                errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                  'assets/images/error_image.webp',
                                                                                  width: 65.8,
                                                                                  height: 81.1,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 0.0, 4.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  asistenciaentrenamientopageVarItem.nombreJugador,
                                                                                  'nombrejugador',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 20.0),
                                        child: Container(
                                          width: 300.0,
                                          height: 94.4,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child:
                                              FutureBuilder<List<JugadoresRow>>(
                                            future:
                                                JugadoresTable().querySingleRow(
                                              queryFn: (q) => q.eqOrNull(
                                                'idequipo_jugador',
                                                widget!.listaequipo,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<JugadoresRow>
                                                  columnJugadoresRowList =
                                                  snapshot.data!;

                                              final columnJugadoresRow =
                                                  columnJugadoresRowList
                                                          .isNotEmpty
                                                      ? columnJugadoresRowList
                                                          .first
                                                      : null;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget!.nombreequipo,
                                                        'nombre equipo',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            fontSize:
                                                                equipoFontSize,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Text(
                                                      'Asistencia Entrenamiento',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat("d/M/y",
                                                            getCurrentTimestamp),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          for (int loop1Index =
                                                                  0;
                                                              loop1Index <
                                                                  _model.puntual
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList()
                                                                      .length;
                                                              loop1Index++) {
                                                            final currentLoop1Item =
                                                                _model.puntual
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList()[
                                                                    loop1Index];
                                                            await AsistenciaEntrenamientosTable()
                                                                .insert({
                                                              'created_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                              'id_jugador':
                                                                  currentLoop1Item,
                                                              'puntual': true,
                                                              'retrasado':
                                                                  false,
                                                              'ausente': false,
                                                            });
                                                          }
                                                          for (int loop2Index =
                                                                  0;
                                                              loop2Index <
                                                                  _model.retraso
                                                                      .length;
                                                              loop2Index++) {
                                                            final currentLoop2Item =
                                                                _model.retraso[
                                                                    loop2Index];
                                                            await AsistenciaEntrenamientosTable()
                                                                .insert({
                                                              'created_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                              'id_jugador':
                                                                  currentLoop2Item,
                                                              'puntual': false,
                                                              'retrasado': true,
                                                              'ausente': false,
                                                            });
                                                          }
                                                          for (int loop3Index =
                                                                  0;
                                                              loop3Index <
                                                                  _model
                                                                      .ausencia
                                                                      .length;
                                                              loop3Index++) {
                                                            final currentLoop3Item =
                                                                _model.ausencia[
                                                                    loop3Index];
                                                            await AsistenciaEntrenamientosTable()
                                                                .insert({
                                                              'created_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                              'id_jugador':
                                                                  currentLoop3Item,
                                                              'puntual': false,
                                                              'retrasado':
                                                                  false,
                                                              'ausente': true,
                                                            });
                                                          }
                                                        },
                                                        text: 'Guardar',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 24.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                            shadows: [
                                                              Shadow(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                offset: Offset(
                                                                    2.0, 2.0),
                                                                blurRadius: 2.0,
                                                              )
                                                            ],
                                                          ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
