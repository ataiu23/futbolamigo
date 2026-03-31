import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class TabletBlockerWidget extends StatelessWidget {
  final Widget child;
  final String titulo;
  final String mensaje;
  final IconData icono;

  const TabletBlockerWidget({
    super.key,
    required this.child,
    this.titulo = 'Dispositivo no soportado',
    this.mensaje =
        'Esta aplicacion solo esta disponible para smartphones. Por favor, accede desde un dispositivo movil.',
    this.icono = Icons.tablet_android,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 600.0) {
      return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icono,
                  size: 80,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                const SizedBox(height: 24),
                Text(
                  titulo,
                  style: FlutterFlowTheme.of(context).headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  mensaje,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return child;
  }
}
