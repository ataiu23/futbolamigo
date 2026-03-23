import '../database.dart';

class EntrenamientosTable extends SupabaseTable<EntrenamientosRow> {
  @override
  String get tableName => 'entrenamientos';

  @override
  EntrenamientosRow createRow(Map<String, dynamic> data) =>
      EntrenamientosRow(data);
}

class EntrenamientosRow extends SupabaseDataRow {
  EntrenamientosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EntrenamientosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idJugador => getField<int>('id_jugador');
  set idJugador(int? value) => setField<int>('id_jugador', value);

  int? get totalgoles => getField<int>('totalgoles');
  set totalgoles(int? value) => setField<int>('totalgoles', value);

  int? get totalpases => getField<int>('totalpases');
  set totalpases(int? value) => setField<int>('totalpases', value);

  int? get idEquipo => getField<int>('id_equipo');
  set idEquipo(int? value) => setField<int>('id_equipo', value);

  DateTime? get velocidad => getField<DateTime>('velocidad');
  set velocidad(DateTime? value) => setField<DateTime>('velocidad', value);

  DateTime? get tiemporegate => getField<DateTime>('tiemporegate');
  set tiemporegate(DateTime? value) =>
      setField<DateTime>('tiemporegate', value);

  int? get conoregate => getField<int>('conoregate');
  set conoregate(int? value) => setField<int>('conoregate', value);
}
