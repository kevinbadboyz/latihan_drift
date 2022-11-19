// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class JobTitleData extends DataClass implements Insertable<JobTitleData> {
  final int id;
  final String code;
  final String name;
  final String status;
  const JobTitleData(
      {required this.id,
      required this.code,
      required this.name,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    return map;
  }

  JobTitleCompanion toCompanion(bool nullToAbsent) {
    return JobTitleCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      status: Value(status),
    );
  }

  factory JobTitleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobTitleData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
    };
  }

  JobTitleData copyWith(
          {int? id, String? code, String? name, String? status}) =>
      JobTitleData(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('JobTitleData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobTitleData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.status == this.status);
}

class JobTitleCompanion extends UpdateCompanion<JobTitleData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> status;
  const JobTitleCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
  });
  JobTitleCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String status,
  })  : code = Value(code),
        name = Value(name),
        status = Value(status);
  static Insertable<JobTitleData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    });
  }

  JobTitleCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<String>? name,
      Value<String>? status}) {
    return JobTitleCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobTitleCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $JobTitleTable extends JobTitle
    with TableInfo<$JobTitleTable, JobTitleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobTitleTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 15),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, code, name, status];
  @override
  String get aliasedName => _alias ?? 'job_title';
  @override
  String get actualTableName => 'job_title';
  @override
  VerificationContext validateIntegrity(Insertable<JobTitleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobTitleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobTitleData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $JobTitleTable createAlias(String alias) {
    return $JobTitleTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $JobTitleTable jobTitle = $JobTitleTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [jobTitle];
}
