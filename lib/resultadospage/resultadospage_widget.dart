import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/components/tablet_blocker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'resultadospage_model.dart';
export 'resultadospage_model.dart';

class ResultadospageWidget extends StatefulWidget {
  const ResultadospageWidget({
    super.key,
    required this.idequipo,
  });

  final int? idequipo;

  static String routeName = 'resultadospage';
  static String routePath = '/resultadospage';

  @override
  State<ResultadospageWidget> createState() => _ResultadospageWidgetState();
}

class _ResultadospageWidgetState extends State<ResultadospageWidget> {
  late ResultadospageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultadospageModel());
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
    final equipoFontSize = isSmallScreen ? 13.0 : 11.0;
    final columnaFontSize = isSmallScreen ? 13.0 : 11.0;
    final contenidoClubFontSize = isSmallScreen ? 11.0 : 8.0;
    final contenidoNumeroFontSize = isSmallScreen ? null : 11.0;

    return TabletBlockerWidget(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            bottom: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/sing_in.webp').image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 40.0),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 400.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            flex: 35,
                            child: _buildUltimoPartidoSection(),
                          ),
                          SizedBox(height: 8.0),
                          Flexible(
                            flex: 30,
                            child: _buildClasificacionSection(
                                equipoFontSize,
                                columnaFontSize,
                                contenidoClubFontSize,
                                contenidoNumeroFontSize),
                          ),
                          SizedBox(height: 8.0),
                          Flexible(
                            flex: 35,
                            child: _buildProximoPartidoSection(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: wrapWithModel(
            model: _model.navbarequiposModel,
            updateCallback: () => safeSetState(() {}),
            child: NavbarequiposWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildUltimoPartidoSection() {
    return FutureBuilder<List<ResultadosRow>>(
      future: ResultadosTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull('id_equipo', widget.idequipo)
            .ltOrNull('Fecha', supaSerialize<DateTime>(getCurrentTimestamp))
            .order('Fecha'),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final resultados = snapshot.data!;
        final partido = resultados.isNotEmpty ? resultados.first : null;

        if (partido == null) {
          return _buildEmptySection('No hay partidos jugados');
        }

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Último Partido',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.interTight(),
                        fontSize: 20.0,
                      ),
                ),
                SizedBox(height: 4.0),
                Text(
                  valueOrDefault<String>(
                    dateTimeFormat("d/M/y", partido.fecha),
                    'fecha',
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(),
                        fontSize: 11.0,
                      ),
                ),
              ],
            ),
            // Logos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTeamLogo(partido.iogoclubLocal),
                _buildTeamLogo(partido.logoclubVisitante),
              ],
            ),
            // Nombres equipos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    valueOrDefault<String>(partido.clubLocal, 'local'),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(),
                          fontSize: 14.0,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    valueOrDefault<String>(partido.clubVisitante, 'visitante'),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(),
                          fontSize: 14.0,
                        ),
                  ),
                ),
              ],
            ),
            // Marcador
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  valueOrDefault<String>(
                    partido.golesEquipoLocal?.toString(),
                    '*',
                  ),
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        font: GoogleFonts.interTight(),
                        fontSize: 36.0,
                      ),
                ),
                Text(
                  '-',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontSize: 36.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    partido.golesEquipoVisitante?.toString(),
                    '*',
                  ),
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        font: GoogleFonts.interTight(),
                        fontSize: 36.0,
                      ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildClasificacionSection(
      double equipoFontSize,
      double columnaFontSize,
      double contenidoClubFontSize,
      double? contenidoNumeroFontSize) {
    return FutureBuilder<List<ClasificacionRow>>(
      future: ClasificacionTable().queryRows(
        queryFn: (q) => q
            .eqOrNull('id_equipo', widget.idequipo?.toDouble())
            .order('puntos', ascending: false),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final equipos = snapshot.data!;

        if (equipos.isEmpty) {
          return _buildEmptySection('No hay datos de clasificación');
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: FlutterFlowDataTable<ClasificacionRow>(
            controller: _model.paginatedDataTableController,
            data: equipos,
            columnsBuilder: (onSortChanged) => [
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Equipo',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: equipoFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                fixedWidth: 70.0,
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Pj',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: columnaFontSize,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Pg',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: columnaFontSize,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Pe',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: columnaFontSize,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Pp',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: columnaFontSize,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Ptos',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: columnaFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                fixedWidth: 45.0,
              ),
            ],
            dataRowBuilder: (equipo, index, selected, onSelectChanged) =>
                DataRow(
              color: MaterialStateProperty.all(
                index % 2 == 0
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : FlutterFlowTheme.of(context).primaryBackground,
              ),
              cells: [
                DataCell(Text(
                  valueOrDefault<String>(equipo.club, 'club'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        fontWeight: FontWeight.w600,
                        fontSize: contenidoClubFontSize,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.pjugado?.toString(), 'Pj'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: contenidoNumeroFontSize,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.pganado?.toString(), 'Pg'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: contenidoNumeroFontSize,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.pempatado?.toString(), 'Pe'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: contenidoNumeroFontSize,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.pperdido?.toString(), 'Pp'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: contenidoNumeroFontSize,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.puntos?.toString(), 'Ptos'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        fontWeight: FontWeight.w600,
                        fontSize: contenidoNumeroFontSize,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.pganado?.toString(), 'Pg'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: 11.0,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.pempatado?.toString(), 'Pe'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: 11.0,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.pperdido?.toString(), 'Pp'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: 11.0,
                      ),
                )),
                DataCell(Text(
                  valueOrDefault<String>(equipo.puntos?.toString(), 'Ptos'),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        fontWeight: FontWeight.w600,
                        fontSize: contenidoClubFontSize,
                      ),
                )),
              ],
            ),
            paginated: false,
            selectable: false,
            headingRowHeight: 32.0,
            dataRowHeight: 28.0,
            columnSpacing: 16.0,
            headingRowColor: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(8.0),
            addHorizontalDivider: true,
            addTopAndBottomDivider: false,
            hideDefaultHorizontalDivider: true,
            horizontalDividerColor:
                FlutterFlowTheme.of(context).secondaryBackground,
            horizontalDividerThickness: 1.0,
            addVerticalDivider: false,
          ),
        );
      },
    );
  }

  Widget _buildProximoPartidoSection() {
    return FutureBuilder<List<ResultadosRow>>(
      future: ResultadosTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull('id_equipo', widget.idequipo)
            .gteOrNull('Fecha', supaSerialize<DateTime>(getCurrentTimestamp))
            .order('Fecha', ascending: true),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final resultados = snapshot.data!;
        final partido = resultados.isNotEmpty ? resultados.first : null;

        if (partido == null) {
          return _buildEmptySection('No hay próximos partidos');
        }

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Próximo Partido',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.interTight(),
                        fontSize: 20.0,
                      ),
                ),
                SizedBox(height: 4.0),
                // Fecha y hora
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fecha:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(),
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0,
                          ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      valueOrDefault<String>(
                        dateTimeFormat("d/M/y", partido.fecha),
                        'fecha',
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(),
                            fontSize: 11.0,
                          ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Hora',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(),
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0,
                          ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      valueOrDefault<String>(
                        dateTimeFormat("Hm", partido.hora?.time),
                        '- - : - -',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(),
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            // Logos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTeamLogo(partido.iogoclubLocal),
                _buildTeamLogo(partido.logoclubVisitante),
              ],
            ),
            // Nombres equipos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    valueOrDefault<String>(partido.clubLocal, 'local'),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(),
                          fontSize: 14.0,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    valueOrDefault<String>(partido.clubVisitante, 'visitante'),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(),
                          fontSize: 14.0,
                        ),
                  ),
                ),
              ],
            ),
            // Marcador (0-0 para próximo partido)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '0',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        font: GoogleFonts.interTight(),
                        fontSize: 36.0,
                      ),
                ),
                Text(
                  '-',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontSize: 36.0,
                      ),
                ),
                Text(
                  '0',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        font: GoogleFonts.interTight(),
                        fontSize: 36.0,
                      ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildTeamLogo(String? url) {
    if (url == null || url.isEmpty) {
      return Container(
        width: 50.0,
        height: 50.0,
        color: Colors.grey,
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        url,
        width: 50.0,
        height: 50.0,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildEmptySection(String message) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    );
  }
}
