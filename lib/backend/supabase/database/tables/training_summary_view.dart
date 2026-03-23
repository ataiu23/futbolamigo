import '../database.dart';

class TrainingSummaryViewTable extends SupabaseTable<TrainingSummaryViewRow> {
  @override
  String get tableName => 'training_summary_view';

  @override
  TrainingSummaryViewRow createRow(Map<String, dynamic> data) =>
      TrainingSummaryViewRow(data);
}

class TrainingSummaryViewRow extends SupabaseDataRow {
  TrainingSummaryViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingSummaryViewTable();

  int? get idJugadorasistencia => getField<int>('id_jugadorasistencia');
  set idJugadorasistencia(int? value) =>
      setField<int>('id_jugadorasistencia', value);

  int? get totalPuntual => getField<int>('total_puntual');
  set totalPuntual(int? value) => setField<int>('total_puntual', value);

  int? get totalRetrasado => getField<int>('total_retrasado');
  set totalRetrasado(int? value) => setField<int>('total_retrasado', value);

  int? get totalAusente => getField<int>('total_ausente');
  set totalAusente(int? value) => setField<int>('total_ausente', value);

  int? get totalEntrenamientos => getField<int>('total_entrenamientos');
  set totalEntrenamientos(int? value) =>
      setField<int>('total_entrenamientos', value);

  double? get porcentajePuntualDecimal =>
      getField<double>('porcentaje_puntual_decimal');
  set porcentajePuntualDecimal(double? value) =>
      setField<double>('porcentaje_puntual_decimal', value);

  String? get porcentajePuntualTexto =>
      getField<String>('porcentaje_puntual_texto');
  set porcentajePuntualTexto(String? value) =>
      setField<String>('porcentaje_puntual_texto', value);

  double? get porcentajeRetrasadoDecimal =>
      getField<double>('porcentaje_retrasado_decimal');
  set porcentajeRetrasadoDecimal(double? value) =>
      setField<double>('porcentaje_retrasado_decimal', value);

  String? get porcentajeRetrasadoTexto =>
      getField<String>('porcentaje_retrasado_texto');
  set porcentajeRetrasadoTexto(String? value) =>
      setField<String>('porcentaje_retrasado_texto', value);

  double? get porcentajeAusenteDecimal =>
      getField<double>('porcentaje_ausente_decimal');
  set porcentajeAusenteDecimal(double? value) =>
      setField<double>('porcentaje_ausente_decimal', value);

  String? get porcentajeAusenteTexto =>
      getField<String>('porcentaje_ausente_texto');
  set porcentajeAusenteTexto(String? value) =>
      setField<String>('porcentaje_ausente_texto', value);
}
