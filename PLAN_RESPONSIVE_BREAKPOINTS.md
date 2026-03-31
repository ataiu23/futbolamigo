# PLAN: Implementacion de Responsive Breakpoints v2.0

## Objetivo

Implementar validacion de tamano de pantalla en toda la aplicacion para:
- Soportar solo smartphones Android e iOS (320px - 600px)
- Bloquear tablets y dispositivos superiores (>= 600px)
- Mostrar mensaje de error cuando se detecte una tablet

---

## 1. Definicion de Breakpoints

Modificar en `lib/flutter_flow/flutter_flow_util.dart`:

```dart
// breakpoints existentes
const kBreakpointSmall = 479.0;
const kBreakpointMedium = 767.0;
const kBreakpointLarge = 991.0;

// nuevos breakpoints
const kMinPhoneWidth = 320.0;
const kMaxPhoneWidth = 600.0;  // maximo smartphone soportado
```

---

## 2. Aprovechar `responsiveVisibility` Existente

La funcion ya existe en `lib/flutter_flow/flutter_flow_util.dart` (linea 449) pero **NO se usa en ninguna parte del proyecto**.

### 2.1 Modificaciones propuestas

```dart
// Agregar a flutter_flow_util.dart

bool isPhone(BuildContext context) {
  return responsiveVisibility(
    context: context,
    phone: true,
    tablet: false,
    tabletLandscape: false,
    desktop: false,
  );
}

bool isTabletOrLarger(BuildContext context) {
  return !isPhone(context);
}

enum DeviceType {
  phoneSmall,   // < 400px
  phoneMedium,  // 400 - 480px
  phoneLarge,   // 480 - 600px
  tablet,       // >= 600px
  desktop       // >= 991px
}

DeviceType getDeviceType(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  
  if (width < 400.0) return DeviceType.phoneSmall;
  if (width < 480.0) return DeviceType.phoneMedium;
  if (width < 600.0) return DeviceType.phoneLarge;
  if (width < 991.0) return DeviceType.tablet;
  return DeviceType.desktop;
}
```

### 2.2 Usos actuales de MediaQuery (88 total)

| Categoria | Cantidad | Accion |
|-----------|----------|--------|
| `MediaQuery.sizeOf(...).width/height` | ~75 | **Revisar** - necesitan validacion |
| `MediaQuery.viewInsetsOf` | 7 | **IGNORAR** - teclado virtual |
| `MediaQuery.of(...).textScaler` | 1 | **IGNORAR** - accesibilidad |
| Definiciones en utils | 5 | **IGNORAR** - ya son utilitarios |

---

## 3. Utilitarios Centralizados

### 3.1 Nuevo archivo: `lib/responsive_utils.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_flow/flutter_flow_util.dart';

class ResponsiveUtils {
  static bool isValidPhoneSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= kMinPhoneWidth && width < kMaxPhoneWidth;
  }

  static bool isTabletOrLarger(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= kMaxPhoneWidth;
  }

  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 400.0) return DeviceType.phoneSmall;
    if (width < 480.0) return DeviceType.phoneMedium;
    if (width < 600.0) return DeviceType.phoneLarge;
    if (width < 991.0) return DeviceType.tablet;
    return DeviceType.desktop;
  }
}

enum DeviceType {
  phoneSmall,
  phoneMedium,
  phoneLarge,
  tablet,
  desktop
}
```

### 3.2 Nuevo componente: `lib/components/tablet_blocker_widget.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_flow/flutter_flow_theme.dart';

class TabletBlockerWidget extends StatelessWidget {
  final Widget child;
  final String titulo;
  final String mensaje;
  final IconData icono;

  const TabletBlockerWidget({
    super.key,
    required this.child,
    this.titulo = 'Dispositivo no soportado',
    this.mensaje = 'Esta aplicacion solo esta disponible para smartphones. Por favor, accede desde un dispositivo movil.',
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
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icono,
                  size: 80,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                SizedBox(height: 24),
                Text(
                  titulo,
                  style: FlutterFlowTheme.of(context).headlineSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
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
```

---

## 4. Paginas y Componentes a Modificar

### Paginas principales (21)

| # | Archivo | Criticidad | Usos MediaQuery |
|---|---------|------------|------------------|
| 1 | login_widget.dart | Alta | 1 |
| 2 | sign_widget.dart | Alta | 0 |
| 3 | home_page_widget.dart | Alta | 5 |
| 4 | perfilpage_widget.dart | Alta | 0 |
| 5 | jugadorespage_widget.dart | Media | 0 |
| 6 | equipospage_widget.dart | Media | 4 |
| 7 | partidopage_widget.dart | Alta | 13 |
| 8 | partidoomlinepage_widget.dart | Alta | 12 |
| 9 | resultadospage_widget.dart | Media | 0 |
| 10 | notificacionpage_widget.dart | Media | 4 |
| 11 | notificacionentrenadorpage_widget.dart | Media | 5 |
| 12 | entrenamientopage_widget.dart | Media | 0 |
| 13 | entrenadorespage_widget.dart | Media | 4 |
| 14 | estadisticaspage_widget.dart | Media | 4 |
| 15 | calendariopagejavi_widget.dart | Media | 3 |
| 16 | convocatoriapage_widget.dart | Media | 0 |
| 17 | infojugadorpage_widget.dart | Media | 0 |
| 18 | asistenciaentrenamientopage_widget.dart | Media | 0 |
| 19 | chat_widget.dart | Alta | 8 |
| 20 | selectpageequipos_widget.dart | Media | 4 |
| 21 | pdf_viewer_widget.dart | Baja | 0 |

### Componentes (12)

| # | Archivo | Usos MediaQuery |
|---|---------|-----------------|
| 1 | seleccionjugadores_widget.dart | 2 |
| 2 | navbarehome1_widget.dart | 0 |
| 3 | navbarhome_widget.dart | 0 |
| 4 | navbarequipos_widget.dart | 0 |
| 5 | navbarnotificaciones_widget.dart | 0 |
| 6 | navbaregistro_widget.dart | 0 |
| 7 | gol_widget.dart | 3 |
| 8 | golno_amigo_widget.dart | 1 |
| 9 | anulagol_widget.dart | 2 |
| 10 | tarjeta_widget.dart | 4 |
| 11 | editarpartido_escritura_widget.dart | 2 |
| 12 | adjuntar_chat_widget.dart | 2 |

---

## 5. Secuencia de Implementacion

### FASE 1: Core (main.dart + utilities)

- [ ] **1.1** Modificar `flutter_flow_util.dart` - agregar `isPhone()`, `isTabletOrLarger()`, `getDeviceType()`
- [ ] **1.2** Crear `lib/responsive_utils.dart`
- [ ] **1.3** Crear `lib/components/tablet_blocker_widget.dart`
- [ ] **1.4** Crear `lib/tablet_not_supported_page/tablet_not_supported_page_widget.dart`
- [ ] **1.5** Modificar `index.dart` - agregar ruta `/tabletNotSupported`
- [ ] **1.6** Modificar `main.dart` - validacion global temprana

### FASE 2: Paginas (21 paginas)

- [ ] **2.1** login_widget.dart
- [ ] **2.2** sign_widget.dart
- [ ] **2.3** home_page_widget.dart
- [ ] **2.4** perfilpage_widget.dart
- [ ] **2.5** jugadorespage_widget.dart
- [ ] **2.6** equipospage_widget.dart
- [ ] **2.7** partidopage_widget.dart
- [ ] **2.8** partidoomlinepage_widget.dart
- [ ] **2.9** resultadospage_widget.dart
- [ ] **2.10** notificacionpage_widget.dart
- [ ] **2.11** notificacionentrenadorpage_widget.dart
- [ ] **2.12** entrenamientopage_widget.dart
- [ ] **2.13** entrenadorespage_widget.dart
- [ ] **2.14** estadisticaspage_widget.dart
- [ ] **2.15** calendariopagejavi_widget.dart
- [ ] **2.16** convocatoriapage_widget.dart
- [ ] **2.17** infojugadorpage_widget.dart
- [ ] **2.18** asistenciaentrenamientopage_widget.dart
- [ ] **2.19** chat_widget.dart
- [ ] **2.20** selectpageequipos_widget.dart
- [ ] **2.21** pdf_viewer_widget.dart

### FASE 3: Componentes (12 componentes)

- [ ] **3.1** seleccionjugadores_widget.dart
- [ ] **3.2** navbarehome1_widget.dart
- [ ] **3.3** navbarhome_widget.dart
- [ ] **3.4** navbarequipos_widget.dart
- [ ] **3.5** navbarnotificaciones_widget.dart
- [ ] **3.6** navbaregistro_widget.dart
- [ ] **3.7** gol_widget.dart
- [ ] **3.8** golno_amigo_widget.dart
- [ ] **3.9** anulagol_widget.dart
- [ ] **3.10** tarjeta_widget.dart
- [ ] **3.11** editarpartido_escritura_widget.dart
- [ ] **3.12** adjuntar_chat_widget.dart

### FASE 4: Testing

- [ ] **4.1** Testing en emulador 320px
- [ ] **4.2** Testing en emulador 360px
- [ ] **4.3** Testing en emulador 400px
- [ ] **4.4** Testing en emulador 480px
- [ ] **4.5** Testing en emulador 600px (debe bloquear)
- [ ] **4.6** Testing en tablet 768px (debe bloquear)
- [ ] **4.7** Testing en tablet 1024px (debe bloquear)

---

## 6. Mejoras Adicionales

| # | Mejora | Descripcion |
|---|--------|-------------|
| 1 | **Validacion global anticipada** | Bloquear en main.dart antes de cargar cualquier UI |
| 2 | **Pagina de error dedicada** | `/tabletNotSupported` con mensaje claro e instrucciones |
| 3 | **Orientacion forzada** | Mantener portrait only (ya existe en main.dart) |
| 4 | **Cache de validacion** | Variable estatica para no recalcular en cada rebuild |
| 5 | **Logging de dispositivos** | Registrar intentos de acceso desde tablets |
| 6 | **Tests automatizados** | Crear tests que verifiquen cada breakpoint |
| 7 | **Actualizar AGENTS.md** | Incluir esta implementacion en la guia |
| 8 | **Modo desarrollo** | Flag para deshabilitar bloqueo en debug mode |
| 9 | **Analytics** | Contar accesos desde tablets para decision futura |
| 10 | **Version web (PWA)** | Redirigir a version web en tablets |

---

## 7. Consideraciones Tecnicas

- **SDK**: `>=3.0.0 <4.0.0` (Flutter 3.x)
- **MediaQuery.viewInsetsOf**: NO BLOQUEAR - necesario para el teclado virtual en cualquier dispositivo
- **MediaQuery.textScaler**: NO BLOQUEAR - es para accesibilidad
- **Mensajes**: Preparar para multilenguaje (espanol/ingles)
- **Objetivo final**: Solo smartphones (320px - 600px)

---

## 8. Ejemplo de Implementacion por Pagina

```dart
// Antes
class HomePageWidget extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        // ...
      ),
    );
  }
}

// Despues
class HomePageWidget extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return TabletBlockerWidget(
      child: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          // ...
        ),
      ),
    );
  }
}

// Alternativa: validacion en initState
class LoginWidget extends StatefulWidget {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ResponsiveUtils.isTabletOrLarger(context)) {
        context.go('/tabletNotSupported');
      }
    });
  }
}
```

---

## 9. Verificacion Previa al Commit

```bash
# Analisis estatico
flutter analyze

# Prueba unitaria (crear tests)
flutter test

# Build debug
flutter build apk --debug

# Build release
flutter build apk --release
```

---

**Fecha de creacion**: 2026-03-30
**Versión**: 1.0
**Autor**: Development Team
