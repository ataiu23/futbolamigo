import '../database.dart';

class NoticiasTable extends SupabaseTable<NoticiasRow> {
  @override
  String get tableName => 'NOTICIAS';

  @override
  NoticiasRow createRow(Map<String, dynamic> data) => NoticiasRow(data);
}

class NoticiasRow extends SupabaseDataRow {
  NoticiasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NoticiasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get imagenNoticia => getField<String>('Imagen_noticia');
  set imagenNoticia(String? value) => setField<String>('Imagen_noticia', value);

  String? get tituloNoticia => getField<String>('Titulo_noticia');
  set tituloNoticia(String? value) => setField<String>('Titulo_noticia', value);

  String? get textoNoticia => getField<String>('Texto_noticia');
  set textoNoticia(String? value) => setField<String>('Texto_noticia', value);

  String? get imagenbinario => getField<String>('imagenbinario');
  set imagenbinario(String? value) => setField<String>('imagenbinario', value);
}
