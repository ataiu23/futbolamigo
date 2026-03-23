import '../database.dart';

class TrainingSummaryTable extends SupabaseTable<TrainingSummaryRow> {
  @override
  String get tableName => 'training_summary';

  @override
  TrainingSummaryRow createRow(Map<String, dynamic> data) =>
      TrainingSummaryRow(data);
}

class TrainingSummaryRow extends SupabaseDataRow {
  TrainingSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingSummaryTable();

  int get idJugadorasistencia => getField<int>('id_jugadorasistencia')!;
  set idJugadorasistencia(int value) =>
      setField<int>('id_jugadorasistencia', value);

  int? get totalPuntual => getField<int>('total_puntual');
  set totalPuntual(int? value) => setField<int>('total_puntual', value);

  int? get totalRetrasado => getField<int>('total_retrasado');
  set totalRetrasado(int? value) => setField<int>('total_retrasado', value);

  int? get totalAusente => getField<int>('total_ausente');
  set totalAusente(int? value) => setField<int>('total_ausente', value);
}
