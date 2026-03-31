# AGENTS.md - Guia para Desarrolladores de Futbol Amigo

## Descripcion del Proyecto

Esta es una aplicacion movil Flutter/Dart para gestion de futbol/deportes. La app usa Supabase como backend e incluye autenticacion, gestion de jugadores, seguimiento de partidos y mas.

---

## Comandos de Compilacion, Lint y Pruebas

### Requisitos Previos
- Flutter SDK (>=3.0.0, <4.0.0)
- Dart SDK
- Android Studio o Xcode para compilaciones moviles

### Instalacion
```bash
flutter pub get
```

### Ejecutar la App
```bash
flutter run                    # Ejecutar en dispositivo/emulador conectado
flutter run -d <device_id>   # Ejecutar en dispositivo especifico
```

### Analisis de Codigo (Linting)
```bash
flutter analyze               # Ejecutar analisis estatico
flutter analyze lib/         # Analizar directorio especifico
```

### Ejecutar Pruebas
```bash
flutter test                  # Ejecutar todas las pruebas
flutter test test/           # Ejecutar todas las pruebas en directorio test
flutter test test/widget_test.dart    # Ejecutar archivo de prueba individual
flutter test --name "testName"         # Ejecutar pruebas que coincidan con patron
```

### Compilacion
```bash
flutter build apk --debug     # APK debug
flutter build apk --release  # APK release
flutter build ios            # Compilacion iOS (requiere macOS)
```

---

## Guías de Estilo de Codigo

### Organizacion de Archivos

**Estructura de Paginas** - Cada pagina sigue este patron:
- `lib/{nombrepagina}/{nombrepagina}_widget.dart` - Codigo del widget/UI
- `lib/{nombrepagina}/{nombrepagina}_model.dart` - Codigo del modelo/gestion de estado

Ejemplo:
```
lib/home_page/
  home_page_widget.dart
  home_page_model.dart
```

### Convenciones de Importacion

Ordena las importaciones asi:
1. Paquetes del Dart SDK (ej. `dart:ui`, `package:flutter/material.dart`)
2. Paquetes externos (ej. `package:provider/provider.dart`)
3. Imports relativos de este proyecto (ej. `/backend/supabase/supabase.dart`)
4. Imports relativos de flutter_flow (ej. `/flutter_flow/flutter_flow_util.dart`)

```dart
// Buen orden de imports:
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
```

### Convenciones de Nomenclatura

| Elemento | Convencion | Ejemplo |
|---------|------------|---------|
| Clases | PascalCase | `HomePageWidget`, `LoginModel` |
| Archivos | snake_case | `home_page_widget.dart` |
| Variables | camelCase | `scaffoldKey`, `actualuser` |
| Constantes | camelCase | `kSupabaseUrl` (prefijo con k) |
| Miembros privados | _camelCase | `_model`, `_myAppState` |
| Rutas | PascalCase | `HomePage`, `Login` |
| Nombres de rutas | camelCase | `'HomePage'`, `'login'` |
| Paths de rutas | camelCase | `'/homePage'`, `'/login'` |

### Gestion de Estado

Este proyecto usa **Provider** para gestion de estado y sigue el **patron de modelo FlutterFlow**:

```dart
class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  // Campos de estado
  List<DatosUsuariosRow>? actualuser;
  late Navbarehome1Model navbarehome1Model;

  @override
  void initState(BuildContext context) {
    navbarehome1Model = createModel(context, () => Navbarehome1Model());
  }

  @override
  void dispose() {
    navbarehome1Model.dispose();
  }
}
```

### Estructura de Widgets

Sigue este patron para paginas StatefulWidget:

```dart
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    // Inicializar estado, controladores, etc.
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    // Construir widget tree
  }
}
```

### Manejo de Errores

Usa bloques try/catch con tipos de excepcion especificos:

```dart
try {
  final user = await authManager.signInWithEmail(
    context,
    email,
    password,
  );
  if (user == null) return;
  context.goNamedAuth(HomePageWidget.routeName, context.mounted);
} on AuthException catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error: ${e.message}')),
  );
}
```

Para llamadas al backend, usa FutureBuilder o maneja errores apropiadamente:
```dart
FutureBuilder<List<DatosUsuariosRow>>(
  future: DatosUsuariosTable().querySingleRow(...),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }
    // Manejar datos
  },
)
```

### Navegacion

Usa GoRouter con rutas tipadas:

```dart
context.goNamed(HomePageWidget.routeName);
context.pushNamed(SignWidget.routeName);
context.goNamedAuth(HomePageWidget.routeName, context.mounted);
```

### Acceso a Base de Datos

Consulta Supabase usando las clases de tablas generadas:

```dart
// Una fila
final result = await DatosUsuariosTable().querySingleRow(
  queryFn: (q) => q.eqOrNull('user_id', currentUserUid),
);

// Multiples filas
final results = await NoticiasTable().queryRows(
  queryFn: (q) => q,
);
```

### Patrones Comunes

**Usando safeSetState**: Usa `safeSetState` en lugar de `setState` cuando este disponible para evitar problemas durante la eliminacion de widgets.

**Acceso al Tema**:
```dart
FlutterFlowTheme.of(context).primary
FlutterFlowTheme.of(context).secondaryBackground
FlutterFlowTheme.of(context).titleMedium
```

**MediaQuery para Diseno Responsivo**:
```dart
MediaQuery.sizeOf(context).width * 0.5
MediaQuery.sizeOf(context).height * 0.13
```

### Utilidades de FlutterFlow

Usa las utilidades proporcionadas en `/flutter_flow/flutter_flow_util.dart`:
- `safeSetState` - Actualizacion segura de estado
- `valueOrDefault<T>` - Extraccion de valores nulos-seguros
- `createModel` - Fabrica de modelos
- `wrapWithModel` - Contenedor de componentes

---

## Estructura del Proyecto

```
lib/
  main.dart                    # Punto de entrada de la app
  index.dart                   # Definiciones de rutas
  app_state.dart               # Estado global de la app (FFAppState)
  
  auth/                        # Autenticacion
    supabase_auth/             # Implementacion de auth con Supabase
    auth_manager.dart
  
  backend/
    supabase/
      supabase.dart            # Inicializacion de Supabase
      database/                # Tablas y consultas de base de datos
      storage/                 # Almacenamiento de archivos
  
  flutter_flow/                # Utilidades de FlutterFlow
    flutter_flow_theme.dart
    flutter_flow_util.dart
    flutter_flow_widgets.dart
    nav/                       # Utilidades de navegacion
  
  custom_code/                 # Widgets y acciones personalizadas
    widgets/
    actions/
  
  {nombrepagina}/              # Widgets y modelos de paginas
    {nombrepagina}_widget.dart
    {nombrepagina}_model.dart
```

---

## Archivos de Configuracion

- `pubspec.yaml` - Dependencias y activos
- `analysis_options.yaml` - Reglas de lint (usa `package:flutter_lints/flutter.yaml`)

---

## Notas para Agentes

1. **No hacer commit de secretos** - La anon key de Supabase en `lib/backend/supabase/supabase.dart` debe permanecer privada
2. **Probar antes de hacer commit** - Ejecuta `flutter analyze` para detectar problemas
3. **Seguir el patron widget/modelo** - Mantener UI y estado separados
4. **Usar patrones existentes** - Referencia paginas existentes como `login/` o `home_page/` para patrones
5. **Manejar null safety** - Usa operadores nulos y `valueOrDefault` donde sea apropiado
