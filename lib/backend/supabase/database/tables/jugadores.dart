import '../database.dart';

class JugadoresTable extends SupabaseTable<JugadoresRow> {
  @override
  String get tableName => 'JUGADORES';

  @override
  JugadoresRow createRow(Map<String, dynamic> data) => JugadoresRow(data);
}

class JugadoresRow extends SupabaseDataRow {
  JugadoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => JugadoresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nombreJugador => getField<String>('nombre_jugador');
  set nombreJugador(String? value) => setField<String>('nombre_jugador', value);

  String? get fotoJugador => getField<String>('foto_jugador');
  set fotoJugador(String? value) => setField<String>('foto_jugador', value);

  int? get idequipoJugador => getField<int>('idequipo_jugador');
  set idequipoJugador(int? value) => setField<int>('idequipo_jugador', value);

  bool? get disponiblePartido => getField<bool>('disponible_partido');
  set disponiblePartido(bool? value) =>
      setField<bool>('disponible_partido', value);

  bool? get convocadoPartido => getField<bool>('convocado_partido');
  set convocadoPartido(bool? value) =>
      setField<bool>('convocado_partido', value);

  int? get posicion => getField<int>('posicion');
  set posicion(int? value) => setField<int>('posicion', value);

  String? get pieDominante => getField<String>('pie_dominante');
  set pieDominante(String? value) => setField<String>('pie_dominante', value);
}
