// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $Bz_fileTable extends Bz_file with TableInfo<$Bz_fileTable, Bz_fileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $Bz_fileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateofCreateMeta =
      const VerificationMeta('dateofCreate');
  @override
  late final GeneratedColumn<DateTime> dateofCreate = GeneratedColumn<DateTime>(
      'datepfCreate', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fillMeta = const VerificationMeta('fill');
  @override
  late final GeneratedColumn<String> fill = GeneratedColumn<String>(
      'fill', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, author, dateofCreate, fill];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bz_file';
  @override
  VerificationContext validateIntegrity(Insertable<Bz_fileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['file_name']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('datepfCreate')) {
      context.handle(
          _dateofCreateMeta,
          dateofCreate.isAcceptableOrUnknown(
              data['datepfCreate']!, _dateofCreateMeta));
    } else if (isInserting) {
      context.missing(_dateofCreateMeta);
    }
    if (data.containsKey('fill')) {
      context.handle(
          _fillMeta, fill.isAcceptableOrUnknown(data['fill']!, _fillMeta));
    } else if (isInserting) {
      context.missing(_fillMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bz_fileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bz_fileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      dateofCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}datepfCreate'])!,
      fill: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fill'])!,
    );
  }

  @override
  $Bz_fileTable createAlias(String alias) {
    return $Bz_fileTable(attachedDatabase, alias);
  }
}

class Bz_fileData extends DataClass implements Insertable<Bz_fileData> {
  final int id;
  final String username;
  final String author;
  final DateTime dateofCreate;
  final String fill;
  const Bz_fileData(
      {required this.id,
      required this.username,
      required this.author,
      required this.dateofCreate,
      required this.fill});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_name'] = Variable<String>(username);
    map['author'] = Variable<String>(author);
    map['datepfCreate'] = Variable<DateTime>(dateofCreate);
    map['fill'] = Variable<String>(fill);
    return map;
  }

  Bz_fileCompanion toCompanion(bool nullToAbsent) {
    return Bz_fileCompanion(
      id: Value(id),
      username: Value(username),
      author: Value(author),
      dateofCreate: Value(dateofCreate),
      fill: Value(fill),
    );
  }

  factory Bz_fileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bz_fileData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      author: serializer.fromJson<String>(json['author']),
      dateofCreate: serializer.fromJson<DateTime>(json['dateofCreate']),
      fill: serializer.fromJson<String>(json['fill']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'author': serializer.toJson<String>(author),
      'dateofCreate': serializer.toJson<DateTime>(dateofCreate),
      'fill': serializer.toJson<String>(fill),
    };
  }

  Bz_fileData copyWith(
          {int? id,
          String? username,
          String? author,
          DateTime? dateofCreate,
          String? fill}) =>
      Bz_fileData(
        id: id ?? this.id,
        username: username ?? this.username,
        author: author ?? this.author,
        dateofCreate: dateofCreate ?? this.dateofCreate,
        fill: fill ?? this.fill,
      );
  Bz_fileData copyWithCompanion(Bz_fileCompanion data) {
    return Bz_fileData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      author: data.author.present ? data.author.value : this.author,
      dateofCreate: data.dateofCreate.present
          ? data.dateofCreate.value
          : this.dateofCreate,
      fill: data.fill.present ? data.fill.value : this.fill,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Bz_fileData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('author: $author, ')
          ..write('dateofCreate: $dateofCreate, ')
          ..write('fill: $fill')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, author, dateofCreate, fill);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bz_fileData &&
          other.id == this.id &&
          other.username == this.username &&
          other.author == this.author &&
          other.dateofCreate == this.dateofCreate &&
          other.fill == this.fill);
}

class Bz_fileCompanion extends UpdateCompanion<Bz_fileData> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> author;
  final Value<DateTime> dateofCreate;
  final Value<String> fill;
  const Bz_fileCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.author = const Value.absent(),
    this.dateofCreate = const Value.absent(),
    this.fill = const Value.absent(),
  });
  Bz_fileCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String author,
    required DateTime dateofCreate,
    required String fill,
  })  : username = Value(username),
        author = Value(author),
        dateofCreate = Value(dateofCreate),
        fill = Value(fill);
  static Insertable<Bz_fileData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? author,
    Expression<DateTime>? dateofCreate,
    Expression<String>? fill,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'file_name': username,
      if (author != null) 'author': author,
      if (dateofCreate != null) 'datepfCreate': dateofCreate,
      if (fill != null) 'fill': fill,
    });
  }

  Bz_fileCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? author,
      Value<DateTime>? dateofCreate,
      Value<String>? fill}) {
    return Bz_fileCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      author: author ?? this.author,
      dateofCreate: dateofCreate ?? this.dateofCreate,
      fill: fill ?? this.fill,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['file_name'] = Variable<String>(username.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (dateofCreate.present) {
      map['datepfCreate'] = Variable<DateTime>(dateofCreate.value);
    }
    if (fill.present) {
      map['fill'] = Variable<String>(fill.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Bz_fileCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('author: $author, ')
          ..write('dateofCreate: $dateofCreate, ')
          ..write('fill: $fill')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $Bz_fileTable bzFile = $Bz_fileTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bzFile];
}

typedef $$Bz_fileTableCreateCompanionBuilder = Bz_fileCompanion Function({
  Value<int> id,
  required String username,
  required String author,
  required DateTime dateofCreate,
  required String fill,
});
typedef $$Bz_fileTableUpdateCompanionBuilder = Bz_fileCompanion Function({
  Value<int> id,
  Value<String> username,
  Value<String> author,
  Value<DateTime> dateofCreate,
  Value<String> fill,
});

class $$Bz_fileTableFilterComposer extends Composer<_$AppDb, $Bz_fileTable> {
  $$Bz_fileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateofCreate => $composableBuilder(
      column: $table.dateofCreate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fill => $composableBuilder(
      column: $table.fill, builder: (column) => ColumnFilters(column));
}

class $$Bz_fileTableOrderingComposer extends Composer<_$AppDb, $Bz_fileTable> {
  $$Bz_fileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateofCreate => $composableBuilder(
      column: $table.dateofCreate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fill => $composableBuilder(
      column: $table.fill, builder: (column) => ColumnOrderings(column));
}

class $$Bz_fileTableAnnotationComposer
    extends Composer<_$AppDb, $Bz_fileTable> {
  $$Bz_fileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<DateTime> get dateofCreate => $composableBuilder(
      column: $table.dateofCreate, builder: (column) => column);

  GeneratedColumn<String> get fill =>
      $composableBuilder(column: $table.fill, builder: (column) => column);
}

class $$Bz_fileTableTableManager extends RootTableManager<
    _$AppDb,
    $Bz_fileTable,
    Bz_fileData,
    $$Bz_fileTableFilterComposer,
    $$Bz_fileTableOrderingComposer,
    $$Bz_fileTableAnnotationComposer,
    $$Bz_fileTableCreateCompanionBuilder,
    $$Bz_fileTableUpdateCompanionBuilder,
    (Bz_fileData, BaseReferences<_$AppDb, $Bz_fileTable, Bz_fileData>),
    Bz_fileData,
    PrefetchHooks Function()> {
  $$Bz_fileTableTableManager(_$AppDb db, $Bz_fileTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$Bz_fileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$Bz_fileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$Bz_fileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> author = const Value.absent(),
            Value<DateTime> dateofCreate = const Value.absent(),
            Value<String> fill = const Value.absent(),
          }) =>
              Bz_fileCompanion(
            id: id,
            username: username,
            author: author,
            dateofCreate: dateofCreate,
            fill: fill,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
            required String author,
            required DateTime dateofCreate,
            required String fill,
          }) =>
              Bz_fileCompanion.insert(
            id: id,
            username: username,
            author: author,
            dateofCreate: dateofCreate,
            fill: fill,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$Bz_fileTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $Bz_fileTable,
    Bz_fileData,
    $$Bz_fileTableFilterComposer,
    $$Bz_fileTableOrderingComposer,
    $$Bz_fileTableAnnotationComposer,
    $$Bz_fileTableCreateCompanionBuilder,
    $$Bz_fileTableUpdateCompanionBuilder,
    (Bz_fileData, BaseReferences<_$AppDb, $Bz_fileTable, Bz_fileData>),
    Bz_fileData,
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$Bz_fileTableTableManager get bzFile =>
      $$Bz_fileTableTableManager(_db, _db.bzFile);
}
