import '../database.dart';

class AsistenciaEntrenamientosTable
    extends SupabaseTable<AsistenciaEntrenamientosRow> {
  @override
  String get tableName => 'ASISTENCIA ENTRENAMIENTOS';

  @override
  AsistenciaEntrenamientosRow createRow(Map<String, dynamic> data) =>
      AsistenciaEntrenamientosRow(data);
}

class AsistenciaEntrenamientosRow extends SupabaseDataRow {
  AsistenciaEntrenamientosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AsistenciaEntrenamientosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idJugador => getField<int>('id_jugador');
  set idJugador(int? value) => setField<int>('id_jugador', value);

  bool? get puntual => getField<bool>('puntual');
  set puntual(bool? value) => setField<bool>('puntual', value);

  bool? get retrasado => getField<bool>('retrasado');
  set retrasado(bool? value) => setField<bool>('retrasado', value);

  bool? get ausente => getField<bool>('ausente');
  set ausente(bool? value) => setField<bool>('ausente', value);
}
