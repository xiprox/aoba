import '../schema/schema.graphql.dart';
import 'package:gql/ast.dart';
import 'package:json_annotation/json_annotation.dart';
part 'in_progress_media.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$FetchMedia {
  Variables$Query$FetchMedia({required this.id});

  @override
  factory Variables$Query$FetchMedia.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$FetchMediaFromJson(json);

  final int id;

  Map<String, dynamic> toJson() => _$Variables$Query$FetchMediaToJson(this);
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$FetchMedia) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    return true;
  }

  Variables$Query$FetchMedia copyWith({int? id}) =>
      Variables$Query$FetchMedia(id: id == null ? this.id : id);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchMedia {
  Query$FetchMedia({this.Media, required this.$__typename});

  @override
  factory Query$FetchMedia.fromJson(Map<String, dynamic> json) =>
      _$Query$FetchMediaFromJson(json);

  final Query$FetchMedia$Media? Media;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$FetchMediaToJson(this);
  int get hashCode {
    final l$Media = Media;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Media, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchMedia) || runtimeType != other.runtimeType)
      return false;
    final l$Media = Media;
    final lOther$Media = other.Media;
    if (l$Media != lOther$Media) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchMedia on Query$FetchMedia {
  Query$FetchMedia copyWith(
          {Query$FetchMedia$Media? Function()? Media, String? $__typename}) =>
      Query$FetchMedia(
          Media: Media == null ? this.Media : Media(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const documentNodeQueryFetchMedia = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FetchMedia'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'Media'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'romaji'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'english'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'native'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'userPreferred'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'format'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'startDate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'year'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'month'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'day'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);

@JsonSerializable(explicitToJson: true)
class Query$FetchMedia$Media {
  Query$FetchMedia$Media(
      {required this.id,
      this.title,
      this.format,
      this.status,
      this.description,
      this.startDate,
      required this.$__typename});

  @override
  factory Query$FetchMedia$Media.fromJson(Map<String, dynamic> json) =>
      _$Query$FetchMedia$MediaFromJson(json);

  final int id;

  final Query$FetchMedia$Media$title? title;

  @JsonKey(unknownEnumValue: Enum$MediaFormat.$unknown)
  final Enum$MediaFormat? format;

  @JsonKey(unknownEnumValue: Enum$MediaStatus.$unknown)
  final Enum$MediaStatus? status;

  final String? description;

  final Query$FetchMedia$Media$startDate? startDate;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$FetchMedia$MediaToJson(this);
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$format = format;
    final l$status = status;
    final l$description = description;
    final l$startDate = startDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$format,
      l$status,
      l$description,
      l$startDate,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchMedia$Media) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) return false;
    final l$format = format;
    final lOther$format = other.format;
    if (l$format != lOther$format) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) return false;
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchMedia$Media on Query$FetchMedia$Media {
  Query$FetchMedia$Media copyWith(
          {int? id,
          Query$FetchMedia$Media$title? Function()? title,
          Enum$MediaFormat? Function()? format,
          Enum$MediaStatus? Function()? status,
          String? Function()? description,
          Query$FetchMedia$Media$startDate? Function()? startDate,
          String? $__typename}) =>
      Query$FetchMedia$Media(
          id: id == null ? this.id : id,
          title: title == null ? this.title : title(),
          format: format == null ? this.format : format(),
          status: status == null ? this.status : status(),
          description: description == null ? this.description : description(),
          startDate: startDate == null ? this.startDate : startDate(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchMedia$Media$title {
  Query$FetchMedia$Media$title(
      {this.romaji,
      this.english,
      this.native,
      this.userPreferred,
      required this.$__typename});

  @override
  factory Query$FetchMedia$Media$title.fromJson(Map<String, dynamic> json) =>
      _$Query$FetchMedia$Media$titleFromJson(json);

  final String? romaji;

  final String? english;

  final String? native;

  final String? userPreferred;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$FetchMedia$Media$titleToJson(this);
  int get hashCode {
    final l$romaji = romaji;
    final l$english = english;
    final l$native = native;
    final l$userPreferred = userPreferred;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [l$romaji, l$english, l$native, l$userPreferred, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchMedia$Media$title) ||
        runtimeType != other.runtimeType) return false;
    final l$romaji = romaji;
    final lOther$romaji = other.romaji;
    if (l$romaji != lOther$romaji) return false;
    final l$english = english;
    final lOther$english = other.english;
    if (l$english != lOther$english) return false;
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) return false;
    final l$userPreferred = userPreferred;
    final lOther$userPreferred = other.userPreferred;
    if (l$userPreferred != lOther$userPreferred) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchMedia$Media$title
    on Query$FetchMedia$Media$title {
  Query$FetchMedia$Media$title copyWith(
          {String? Function()? romaji,
          String? Function()? english,
          String? Function()? native,
          String? Function()? userPreferred,
          String? $__typename}) =>
      Query$FetchMedia$Media$title(
          romaji: romaji == null ? this.romaji : romaji(),
          english: english == null ? this.english : english(),
          native: native == null ? this.native : native(),
          userPreferred:
              userPreferred == null ? this.userPreferred : userPreferred(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchMedia$Media$startDate {
  Query$FetchMedia$Media$startDate(
      {this.year, this.month, this.day, required this.$__typename});

  @override
  factory Query$FetchMedia$Media$startDate.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchMedia$Media$startDateFromJson(json);

  final int? year;

  final int? month;

  final int? day;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchMedia$Media$startDateToJson(this);
  int get hashCode {
    final l$year = year;
    final l$month = month;
    final l$day = day;
    final l$$__typename = $__typename;
    return Object.hashAll([l$year, l$month, l$day, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchMedia$Media$startDate) ||
        runtimeType != other.runtimeType) return false;
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) return false;
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) return false;
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchMedia$Media$startDate
    on Query$FetchMedia$Media$startDate {
  Query$FetchMedia$Media$startDate copyWith(
          {int? Function()? year,
          int? Function()? month,
          int? Function()? day,
          String? $__typename}) =>
      Query$FetchMedia$Media$startDate(
          year: year == null ? this.year : year(),
          month: month == null ? this.month : month(),
          day: day == null ? this.day : day(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
