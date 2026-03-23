import '../database.dart';

class DatosUsuariosTable extends SupabaseTable<DatosUsuariosRow> {
  @override
  String get tableName => 'Datos Usuarios';

  @override
  DatosUsuariosRow createRow(Map<String, dynamic> data) =>
      DatosUsuariosRow(data);
}

class DatosUsuariosRow extends SupabaseDataRow {
  DatosUsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DatosUsuariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get isauserpro => getField<bool>('isauserpro');
  set isauserpro(bool? value) => setField<bool>('isauserpro', value);

  bool? get isatrainer => getField<bool>('isatrainer');
  set isatrainer(bool? value) => setField<bool>('isatrainer', value);

  List<int> get equipoAdmin => getListField<int>('equipo_admin');
  set equipoAdmin(List<int>? value) => setListField<int>('equipo_admin', value);

  List<int> get jugadorAdmin => getListField<int>('jugador_admin');
  set jugadorAdmin(List<int>? value) =>
      setListField<int>('jugador_admin', value);

  String? get apellidos => getField<String>('Apellidos');
  set apellidos(String? value) => setField<String>('Apellidos', value);

  String? get telefono => getField<String>('Telefono');
  set telefono(String? value) => setField<String>('Telefono', value);

  String? get nickName => getField<String>('Nick_Name');
  set nickName(String? value) => setField<String>('Nick_Name', value);

  String? get nombre => getField<String>('Nombre');
  set nombre(String? value) => setField<String>('Nombre', value);

  String? get perfilPhoto => getField<String>('perfil_photo');
  set perfilPhoto(String? value) => setField<String>('perfil_photo', value);
}
