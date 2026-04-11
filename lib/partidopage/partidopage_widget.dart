import '/backend/supabase/supabase.dart';
import '/components/anulagol_widget.dart';
import '/components/gol_widget.dart';
import '/components/golno_amigo_widget.dart';
import '/components/navbarequipos_widget.dart';
import '/components/tablet_blocker_widget.dart';
import '/components/tarjeta_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'partidopage_model.dart';
export 'partidopage_model.dart';

class PartidopageWidget extends StatefulWidget {
  const PartidopageWidget({
    super.key,
    required this.idequipo,
  });

  final int? idequipo;

  static String routeName = 'partidopage';
  static String routePath = '/partidopage';

  @override
  State<PartidopageWidget> createState() => _PartidopageWidgetState();
}

class _PartidopageWidgetState extends State<PartidopageWidget> {
  late PartidopageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartidopageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultados = await ResultadosTable().queryRows(
        queryFn: (q) => q
            .gteOrNull(
              'Fecha',
              supaSerialize<DateTime>(getCurrentTimestamp),
            )
            .eqOrNull(
              'id_equipo',
              widget!.idequipo,
            )
            .order('Fecha', ascending: true),
      );
      _model.goleslocal = _model.resultados?.firstOrNull?.golesEquipoLocal;
      _model.golesvisit = _model.resultados?.firstOrNull?.golesEquipoVisitante;
      _model.amarilla =
          _model.resultados!.firstOrNull!.amarilla.toList().cast<int>();
      _model.roja = _model.resultados!.firstOrNull!.roja.toList().cast<int>();
      safeSetState(() {});
      if (_model.resultados?.take(1).toList()?.firstOrNull?.halfNumber == 0) {
        _model.parte = _model.resultados?.firstOrNull?.halfNumber;
        _model.ultimalparte =
            _model.resultados?.firstOrNull?.ultimaParteFinalizada;
        safeSetState(() {});
      } else if ((_model.resultados
                  ?.take(1)
                  .toList()
                  ?.firstOrNull
                  ?.halfNumber !=
              0) &&
          (_model.resultados?.take(1).toList()?.firstOrNull?.halfNumber !=
              10)) {
        _model.fechaInicio = _model.resultados?.firstOrNull?.timestampInicio;
        _model.parte = _model.resultados?.firstOrNull?.halfNumber;
        _model.ultimalparte =
            _model.resultados?.firstOrNull?.ultimaParteFinalizada;
        safeSetState(() {});
        _model.actualizadorContador2 = InstantTimer.periodic(
          duration: Duration(milliseconds: 1000),
          callback: (timer) async {
            _model.contadorv =
                functions.formatearTiempoTranscurrido(_model.fechaInicio!)!;
            safeSetState(() {});
          },
          startImmediately: true,
        );
      } else {
        _model.fechaInicio = _model.resultados?.firstOrNull?.timestampInicio;
        _model.parte = _model.resultados?.firstOrNull?.halfNumber;
        _model.ultimalparte =
            _model.resultados?.firstOrNull?.ultimaParteFinalizada;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.actualizadorContador2?.cancel();
    _model.actualizadorContador?.cancel();
    _model.actualizadorContadorparte2?.cancel();
    _model.actualizadorContadorparte3?.cancel();
    _model.actualizadorContadorparte4?.cancel();
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isSmallScreen = screenWidth < 414;
    final equipoFontSize = isSmallScreen ? 12.0 : 8.0;
    final columnaFontSize = isSmallScreen ? 14.0 : 11.0;
    final ptsFontSize = isSmallScreen ? 14.0 : 11.0;
    final equipoFontWeight = FontWeight.w600;

    return FutureBuilder<List<ResultadosRow>>(
      future: ResultadosTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull(
              'id_equipo',
              widget!.idequipo,
            )
            .gteOrNull(
              'Fecha',
              supaSerialize<DateTime>(getCurrentTimestamp),
            )
            .order('Fecha', ascending: true),
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
        List<ResultadosRow> partidopageResultadosRowList = snapshot.data!;

        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final partidopageResultadosRow = partidopageResultadosRowList.isNotEmpty
            ? partidopageResultadosRowList.first
            : null;

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
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(10.0, -1.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Partido en Directo',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(70.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Fecha:',
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
                                                            fontSize: 12.0,
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
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            "d/M/y",
                                                            partidopageResultadosRow!
                                                                .fecha!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Hora',
                                                        textAlign:
                                                            TextAlign.center,
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
                                                              fontSize: 12.0,
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
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            "Hm",
                                                            partidopageResultadosRow!
                                                                .hora!.time),
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
                                                              fontSize: 12.0,
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -7.17),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.72, -0.69),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              partidopageResultadosRow!
                                                                  .iogoclubLocal!,
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.71, -0.68),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              partidopageResultadosRow!
                                                                  .logoclubVisitante!,
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.66, -0.52),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          partidopageResultadosRow
                                                              ?.clubLocal,
                                                          'local',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.55, -0.52),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          partidopageResultadosRow
                                                              ?.clubVisitante,
                                                          'visitante',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              buttonSize: 40.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              icon: Icon(
                                                                Icons
                                                                    .remove_circle,
                                                                color: Color(
                                                                    0xFFA3ADB4),
                                                                size: 30.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                        .goleslocal !=
                                                                    0) {
                                                                  if ((_model.parte !=
                                                                          0) &&
                                                                      (_model.parte !=
                                                                          10) &&
                                                                      (_model.parte !=
                                                                          null)) {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                AnulagolWidget(
                                                                              idequipo: widget!.idequipo,
                                                                              counter: _model.contadorv,
                                                                              marcadorlocal: _model.goleslocal,
                                                                              idpartido: partidopageResultadosRow?.id,
                                                                              marcadorvisit: _model.golesvisit,
                                                                              nombreclub: partidopageResultadosRow?.clubLocal,
                                                                              anulagol: 'local',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(() =>
                                                                            _model.goleslocalfinal =
                                                                                value));

                                                                    _model.goleslocal =
                                                                        _model
                                                                            .goleslocalfinal;
                                                                    _model.golesvisit =
                                                                        partidopageResultadosRow
                                                                            ?.golesEquipoVisitante;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.15,
                                                            height: 80.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  AnimatedDefaultTextStyle(
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          40.0,
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
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1395),
                                                                curve: Curves
                                                                    .easeInOutQuint,
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .goleslocal
                                                                        ?.toString(),
                                                                    '0',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              buttonSize: 40.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              icon: Icon(
                                                                Icons
                                                                    .add_circle_outlined,
                                                                color: Color(
                                                                    0xFFA3ADB4),
                                                                size: 30.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if ((partidopageResultadosRow?.clubLocal ==
                                                                        'C.D. Amigo') &&
                                                                    (_model.parte !=
                                                                        0) &&
                                                                    (_model.parte !=
                                                                        10) &&
                                                                    (_model.parte !=
                                                                        null)) {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    isDismissible:
                                                                        false,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.6,
                                                                            child:
                                                                                GolWidget(
                                                                              idequipo: widget!.idequipo!,
                                                                              counter: _model.contadorv,
                                                                              marcadorlocal: _model.goleslocal,
                                                                              idpartido: _model.resultados?.firstOrNull?.id,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(() =>
                                                                          _model.abrebottom =
                                                                              value));

                                                                  _model.goleslocal =
                                                                      _model
                                                                          .abrebottom;
                                                                  safeSetState(
                                                                      () {});
                                                                } else if ((partidopageResultadosRow?.clubLocal !=
                                                                        'C.D. Amigo') &&
                                                                    (_model.parte !=
                                                                        0) &&
                                                                    (_model.parte !=
                                                                        10) &&
                                                                    (_model.parte !=
                                                                        null)) {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    isDismissible:
                                                                        false,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.6,
                                                                            child:
                                                                                GolnoAmigoWidget(
                                                                              equiponoamigo: partidopageResultadosRow?.clubLocal,
                                                                              counter: _model.contadorv,
                                                                              marcadorlocal: _model.goleslocal,
                                                                              idpartido: partidopageResultadosRow?.id,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(() =>
                                                                          _model.abrenoamigo =
                                                                              value));

                                                                  _model.goleslocal =
                                                                      _model
                                                                          .abrenoamigo;
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '-',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                fontSize: 50.0,
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
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        20.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .remove_circle,
                                                                      color: Color(
                                                                          0xFFA3ADB4),
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      if (_model
                                                                              .golesvisit !=
                                                                          0) {
                                                                        if ((_model.parte != 0) &&
                                                                            (_model.parte !=
                                                                                10) &&
                                                                            (_model.parte !=
                                                                                null)) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: AnulagolWidget(
                                                                                    idequipo: widget!.idequipo,
                                                                                    counter: _model.contadorv,
                                                                                    marcadorlocal: _model.goleslocal,
                                                                                    idpartido: partidopageResultadosRow?.id,
                                                                                    marcadorvisit: _model.golesvisit,
                                                                                    nombreclub: partidopageResultadosRow?.clubVisitante,
                                                                                    anulagol: 'visitante',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() => _model.golesvisitfinal = value));

                                                                          _model.golesvisit =
                                                                              _model.golesvisitfinal;
                                                                          safeSetState(
                                                                              () {});
                                                                        }
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.15,
                                                                height: 80.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .golesvisit
                                                                          ?.toString(),
                                                                      '0 ',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              40.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      20.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .add_circle_outlined,
                                                                    color: Color(
                                                                        0xFFA3ADB4),
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if ((partidopageResultadosRow
                                                                                ?.clubVisitante ==
                                                                            'C.D. Amigo') &&
                                                                        (_model.parte !=
                                                                            0) &&
                                                                        (_model.parte !=
                                                                            10) &&
                                                                        (_model.parte !=
                                                                            null)) {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        isDismissible:
                                                                            false,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                child: GolWidget(
                                                                                  idequipo: widget!.idequipo!,
                                                                                  counter: _model.contadorv,
                                                                                  idpartido: _model.resultados?.firstOrNull?.id,
                                                                                  marcadorvisit: _model.golesvisit,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(() =>
                                                                              _model.golvisit = value));

                                                                      _model.golesvisit =
                                                                          _model
                                                                              .golvisit;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else if ((partidopageResultadosRow
                                                                                ?.clubVisitante !=
                                                                            'C.D. Amigo') &&
                                                                        (_model.parte !=
                                                                            0) &&
                                                                        (_model.parte !=
                                                                            10) &&
                                                                        (_model.parte !=
                                                                            null)) {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        isDismissible:
                                                                            false,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                child: GolnoAmigoWidget(
                                                                                  equiponoamigo: partidopageResultadosRow?.clubVisitante,
                                                                                  counter: _model.contadorv,
                                                                                  idpartido: partidopageResultadosRow?.id,
                                                                                  marcadorvisit: _model.golesvisit,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(() =>
                                                                              _model.abrenoamigo2 = value));

                                                                      _model.golesvisit =
                                                                          _model
                                                                              .abrenoamigo2;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Text(
                                                () {
                                                  if ((_model.parte != null) &&
                                                      (_model.parte == 1)) {
                                                    return 'Parte 1';
                                                  } else if ((_model.parte !=
                                                          null) &&
                                                      (_model.parte == 2)) {
                                                    return 'Parte 2';
                                                  } else if ((_model.parte !=
                                                          null) &&
                                                      (_model.parte == 0)) {
                                                    return 'DESCANSO - Fin Parte ${valueOrDefault<String>(
                                                      _model.ultimalparte
                                                          ?.toString(),
                                                      'ultparte',
                                                    )}';
                                                  } else if ((_model.parte !=
                                                          null) &&
                                                      (_model.parte == 3)) {
                                                    return 'Parte 3';
                                                  } else if ((_model.parte !=
                                                          null) &&
                                                      (_model.parte == 4)) {
                                                    return 'Parte 4';
                                                  } else if ((_model.parte !=
                                                          null) &&
                                                      (_model.parte == 10)) {
                                                    return 'El partido ha finalizado';
                                                  } else {
                                                    return 'El partido no está en curso';
                                                  }
                                                }(),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 26.0,
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
                                            Text(
                                              valueOrDefault<String>(
                                                _model.contadorv,
                                                '- - : - -',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 30.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed:
                                                        ((_model.parte !=
                                                                    null) ||
                                                                (_model.parte ==
                                                                    0))
                                                            ? null
                                                            : () async {
                                                                if (_model
                                                                        .contadorv ==
                                                                    '00:00') {
                                                                  await ResultadosTable()
                                                                      .update(
                                                                    data: {
                                                                      'GolesEquipo_Local':
                                                                          0,
                                                                      'GolesEquipo_Visitante':
                                                                          0,
                                                                      'timestamp_inicio':
                                                                          supaSerialize<DateTime>(
                                                                              getCurrentTimestamp),
                                                                      'half_number':
                                                                          1,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eqOrNull(
                                                                      'id',
                                                                      partidopageResultadosRow
                                                                          ?.id,
                                                                    ),
                                                                  );
                                                                  _model.fechaInicio =
                                                                      getCurrentTimestamp;
                                                                  _model.goleslocal =
                                                                      0;
                                                                  _model.golesvisit =
                                                                      0;
                                                                  safeSetState(
                                                                      () {});
                                                                  await EventosPartidoTable()
                                                                      .insert({
                                                                    'id_partido':
                                                                        partidopageResultadosRow
                                                                            ?.id,
                                                                    'counter':
                                                                        _model
                                                                            .contadorv,
                                                                    'tipo_evento':
                                                                        'COMIENZO PARTIDO',
                                                                  });
                                                                  _model.parte =
                                                                      1;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.actualizadorContador =
                                                                      InstantTimer
                                                                          .periodic(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    callback:
                                                                        (timer) async {
                                                                      _model.contadorv =
                                                                          functions
                                                                              .formatearTiempoTranscurrido(_model.fechaInicio!)!;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    startImmediately:
                                                                        true,
                                                                  );
                                                                }
                                                              },
                                                    text: 'Inicio',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
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
                                                      color: Color(0xFF06AB97),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22.0),
                                                      disabledColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  if ((_model.parte == 1) ||
                                                      (_model.parte == 2) ||
                                                      (_model.parte == 3))
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        _model
                                                            .actualizadorContador2
                                                            ?.cancel();
                                                        _model
                                                            .actualizadorContador
                                                            ?.cancel();
                                                        _model
                                                            .actualizadorContadorparte3
                                                            ?.cancel();
                                                        _model
                                                            .actualizadorContadorparte2
                                                            ?.cancel();
                                                        _model
                                                            .actualizadorContadorparte4
                                                            ?.cancel();
                                                        if (_model.parte == 1) {
                                                          await ResultadosTable()
                                                              .update(
                                                            data: {
                                                              'half_number': 0,
                                                              'ultima_parte_finalizada':
                                                                  1,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              _model
                                                                  .resultados
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                            ),
                                                          );
                                                          await EventosPartidoTable()
                                                              .insert({
                                                            'id_partido': _model
                                                                .resultados
                                                                ?.firstOrNull
                                                                ?.id,
                                                            'tipo_evento':
                                                                'Descanso',
                                                            'counter': _model
                                                                .contadorv,
                                                          });
                                                          _model.parte = 0;
                                                          _model.contadorv =
                                                              '00:00';
                                                          _model.fechaInicio =
                                                              getCurrentTimestamp;
                                                          _model.ultimalparte =
                                                              1;
                                                          safeSetState(() {});
                                                        } else if (_model
                                                                .parte ==
                                                            2) {
                                                          await ResultadosTable()
                                                              .update(
                                                            data: {
                                                              'half_number': 0,
                                                              'ultima_parte_finalizada':
                                                                  2,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              _model
                                                                  .resultados
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                            ),
                                                          );
                                                          await EventosPartidoTable()
                                                              .insert({
                                                            'id_partido': _model
                                                                .resultados
                                                                ?.firstOrNull
                                                                ?.id,
                                                            'tipo_evento':
                                                                'Descanso',
                                                            'counter': _model
                                                                .contadorv,
                                                          });
                                                          _model.parte = 0;
                                                          _model.contadorv =
                                                              '00:00';
                                                          _model.fechaInicio =
                                                              getCurrentTimestamp;
                                                          _model.ultimalparte =
                                                              2;
                                                          safeSetState(() {});
                                                        } else if (_model
                                                                .parte ==
                                                            3) {
                                                          await ResultadosTable()
                                                              .update(
                                                            data: {
                                                              'half_number': 0,
                                                              'ultima_parte_finalizada':
                                                                  3,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              _model
                                                                  .resultados
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                            ),
                                                          );
                                                          await EventosPartidoTable()
                                                              .insert({
                                                            'id_partido': _model
                                                                .resultados
                                                                ?.firstOrNull
                                                                ?.id,
                                                            'tipo_evento':
                                                                'Descanso',
                                                            'counter': _model
                                                                .contadorv,
                                                          });
                                                          _model.parte = 0;
                                                          _model.contadorv =
                                                              '00:00';
                                                          _model.fechaInicio =
                                                              getCurrentTimestamp;
                                                          _model.ultimalparte =
                                                              3;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      text: 'Descanso',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
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
                                                        color:
                                                            Color(0xFFF9A530),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 3.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                  if ((_model.parte == 0) &&
                                                      (_model.parte != 4))
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        if ((_model.contadorv ==
                                                                '00:00') &&
                                                            (_model.ultimalparte ==
                                                                1)) {
                                                          await ResultadosTable()
                                                              .update(
                                                            data: {
                                                              'half_number': 2,
                                                              'timestamp_inicio':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              partidopageResultadosRow
                                                                  ?.id,
                                                            ),
                                                          );
                                                          _model.fechaInicio =
                                                              getCurrentTimestamp;
                                                          _model.parte = 2;
                                                          _model.ultimalparte =
                                                              1;
                                                          safeSetState(() {});
                                                          await EventosPartidoTable()
                                                              .insert({
                                                            'id_partido':
                                                                partidopageResultadosRow
                                                                    ?.id,
                                                            'tipo_evento':
                                                                'COMIENZO PARTE 2',
                                                            'counter': _model
                                                                .contadorv,
                                                          });
                                                          _model.actualizadorContadorparte2 =
                                                              InstantTimer
                                                                  .periodic(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                            callback:
                                                                (timer) async {
                                                              _model.contadorv =
                                                                  functions
                                                                      .formatearTiempoTranscurrido(
                                                                          _model
                                                                              .fechaInicio!)!;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            startImmediately:
                                                                true,
                                                          );
                                                        } else if ((_model
                                                                    .contadorv ==
                                                                '00:00') &&
                                                            (_model.ultimalparte ==
                                                                2)) {
                                                          await ResultadosTable()
                                                              .update(
                                                            data: {
                                                              'half_number': 3,
                                                              'timestamp_inicio':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              partidopageResultadosRow
                                                                  ?.id,
                                                            ),
                                                          );
                                                          _model.fechaInicio =
                                                              getCurrentTimestamp;
                                                          _model.parte = 3;
                                                          _model.ultimalparte =
                                                              2;
                                                          safeSetState(() {});
                                                          await EventosPartidoTable()
                                                              .insert({
                                                            'id_partido':
                                                                partidopageResultadosRow
                                                                    ?.id,
                                                            'tipo_evento':
                                                                'COMIENZO PARTE  3',
                                                            'counter': _model
                                                                .contadorv,
                                                          });
                                                          _model.actualizadorContadorparte3 =
                                                              InstantTimer
                                                                  .periodic(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                            callback:
                                                                (timer) async {
                                                              _model.contadorv =
                                                                  functions
                                                                      .formatearTiempoTranscurrido(
                                                                          _model
                                                                              .fechaInicio!)!;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            startImmediately:
                                                                true,
                                                          );
                                                        } else if ((_model
                                                                    .contadorv ==
                                                                '00:00') &&
                                                            (_model.ultimalparte ==
                                                                3)) {
                                                          await ResultadosTable()
                                                              .update(
                                                            data: {
                                                              'half_number': 4,
                                                              'timestamp_inicio':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              partidopageResultadosRow
                                                                  ?.id,
                                                            ),
                                                          );
                                                          _model.fechaInicio =
                                                              getCurrentTimestamp;
                                                          _model.parte = 4;
                                                          _model.ultimalparte =
                                                              3;
                                                          safeSetState(() {});
                                                          await EventosPartidoTable()
                                                              .insert({
                                                            'id_partido':
                                                                partidopageResultadosRow
                                                                    ?.id,
                                                            'tipo_evento':
                                                                'COMIENZO PARTE 4',
                                                            'counter': _model
                                                                .contadorv,
                                                          });
                                                          _model.actualizadorContadorparte4 =
                                                              InstantTimer
                                                                  .periodic(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                            callback:
                                                                (timer) async {
                                                              _model.contadorv =
                                                                  functions
                                                                      .formatearTiempoTranscurrido(
                                                                          _model
                                                                              .fechaInicio!)!;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            startImmediately:
                                                                true,
                                                          );
                                                        }
                                                      },
                                                      text: 'Reanudar',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
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
                                                        color:
                                                            Color(0xFF06AB97),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 3.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                  if ((_model.parte == 4) ||
                                                      (_model.parte == 2))
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        if ((_model.parte ==
                                                                2) ||
                                                            (_model.parte ==
                                                                4)) {
                                                          await EventosPartidoTable()
                                                              .insert({
                                                            'id_partido': _model
                                                                .resultados
                                                                ?.firstOrNull
                                                                ?.id,
                                                            'tipo_evento':
                                                                'FINAL DE PARTIDO',
                                                            'counter': _model
                                                                .contadorv,
                                                          });
                                                          await ResultadosTable()
                                                              .update(
                                                            data: {
                                                              'finalizado':
                                                                  true,
                                                              'timestamp_inicio':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                              'half_number': 10,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              _model
                                                                  .resultados
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                            ),
                                                          );
                                                          _model.parte = 10;
                                                          safeSetState(() {});
                                                          await Future.wait([
                                                            Future(() async {
                                                              _model
                                                                  .actualizadorContador2
                                                                  ?.cancel();
                                                            }),
                                                            Future(() async {
                                                              _model
                                                                  .actualizadorContador
                                                                  ?.cancel();
                                                            }),
                                                            Future(() async {
                                                              _model
                                                                  .actualizadorContadorparte2
                                                                  ?.cancel();
                                                            }),
                                                            Future(() async {
                                                              _model
                                                                  .actualizadorContadorparte3
                                                                  ?.cancel();
                                                            }),
                                                            Future(() async {
                                                              _model
                                                                  .actualizadorContadorparte4
                                                                  ?.cancel();
                                                            }),
                                                          ]);
                                                        }
                                                      },
                                                      text: 'Final  ',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
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
                                                        color:
                                                            Color(0xFFF93A3D),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 3.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(18.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if ((_model.parte !=
                                                                0) &&
                                                            (_model.parte !=
                                                                10) &&
                                                            (_model.parte !=
                                                                null)) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      TarjetaWidget(
                                                                    idequipo:
                                                                        widget!
                                                                            .idequipo!,
                                                                    counter: _model
                                                                        .contadorv,
                                                                    idpartido:
                                                                        partidopageResultadosRow
                                                                            ?.id,
                                                                    tarjetacolor:
                                                                        'Amarilla',
                                                                    listaamarilla:
                                                                        _model
                                                                            .amarilla,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.listaamar =
                                                                      value));

                                                          _model.amarilla =
                                                              _model.listaamar!
                                                                  .toList()
                                                                  .cast<int>();
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text:
                                                          'Tarjetas Amarillas',
                                                      icon: Icon(
                                                        Icons.content_copy,
                                                        size: 30.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 52.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconAlignment:
                                                            IconAlignment.end,
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          width: 6.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Visibility(
                                                          visible: _model
                                                                  .amarilla
                                                                  .firstOrNull !=
                                                              0,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child:
                                                                AnimatedDefaultTextStyle(
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
                                                                    fontSize:
                                                                        20.0,
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
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1125),
                                                              curve: Curves
                                                                  .easeInOutQuint,
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .amarilla
                                                                      .length
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if ((_model.parte !=
                                                                0) &&
                                                            (_model.parte !=
                                                                10) &&
                                                            (_model.parte !=
                                                                null)) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      TarjetaWidget(
                                                                    idequipo:
                                                                        widget!
                                                                            .idequipo!,
                                                                    counter: _model
                                                                        .contadorv,
                                                                    idpartido:
                                                                        partidopageResultadosRow
                                                                            ?.id,
                                                                    tarjetacolor:
                                                                        'Roja',
                                                                    listaroja:
                                                                        _model
                                                                            .roja,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.tarjetaroja =
                                                                      value));

                                                          _model.roja = _model
                                                              .tarjetaroja!
                                                              .toList()
                                                              .cast<int>();
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text:
                                                          'Tarjetas Rojas         ',
                                                      icon: Icon(
                                                        Icons
                                                            .content_copy_outlined,
                                                        size: 30.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 52.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconAlignment:
                                                            IconAlignment.end,
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 6.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          border: Border.all(
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Visibility(
                                                          visible: _model.roja
                                                                  .firstOrNull !=
                                                              0,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .roja.length
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    fontSize:
                                                                        20.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
