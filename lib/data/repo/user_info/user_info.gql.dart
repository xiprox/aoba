import 'package:gql/ast.dart';

class Query$FetchBasicUserInfo {
  Query$FetchBasicUserInfo({
    this.Viewer,
    required this.$__typename,
  });

  factory Query$FetchBasicUserInfo.fromJson(Map<String, dynamic> json) {
    final l$Viewer = json['Viewer'];
    final l$$__typename = json['__typename'];
    return Query$FetchBasicUserInfo(
      Viewer: l$Viewer == null
          ? null
          : Query$FetchBasicUserInfo$Viewer.fromJson(
              (l$Viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchBasicUserInfo$Viewer? Viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Viewer = Viewer;
    _resultData['Viewer'] = l$Viewer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Viewer = Viewer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Viewer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchBasicUserInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Viewer = Viewer;
    final lOther$Viewer = other.Viewer;
    if (l$Viewer != lOther$Viewer) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchBasicUserInfo
    on Query$FetchBasicUserInfo {
  CopyWith$Query$FetchBasicUserInfo<Query$FetchBasicUserInfo> get copyWith =>
      CopyWith$Query$FetchBasicUserInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FetchBasicUserInfo<TRes> {
  factory CopyWith$Query$FetchBasicUserInfo(
    Query$FetchBasicUserInfo instance,
    TRes Function(Query$FetchBasicUserInfo) then,
  ) = _CopyWithImpl$Query$FetchBasicUserInfo;

  factory CopyWith$Query$FetchBasicUserInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchBasicUserInfo;

  TRes call({
    Query$FetchBasicUserInfo$Viewer? Viewer,
    String? $__typename,
  });
  CopyWith$Query$FetchBasicUserInfo$Viewer<TRes> get Viewer;
}

class _CopyWithImpl$Query$FetchBasicUserInfo<TRes>
    implements CopyWith$Query$FetchBasicUserInfo<TRes> {
  _CopyWithImpl$Query$FetchBasicUserInfo(
    this._instance,
    this._then,
  );

  final Query$FetchBasicUserInfo _instance;

  final TRes Function(Query$FetchBasicUserInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? Viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchBasicUserInfo(
        Viewer: Viewer == _undefined
            ? _instance.Viewer
            : (Viewer as Query$FetchBasicUserInfo$Viewer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchBasicUserInfo$Viewer<TRes> get Viewer {
    final local$Viewer = _instance.Viewer;
    return local$Viewer == null
        ? CopyWith$Query$FetchBasicUserInfo$Viewer.stub(_then(_instance))
        : CopyWith$Query$FetchBasicUserInfo$Viewer(
            local$Viewer, (e) => call(Viewer: e));
  }
}

class _CopyWithStubImpl$Query$FetchBasicUserInfo<TRes>
    implements CopyWith$Query$FetchBasicUserInfo<TRes> {
  _CopyWithStubImpl$Query$FetchBasicUserInfo(this._res);

  TRes _res;

  call({
    Query$FetchBasicUserInfo$Viewer? Viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchBasicUserInfo$Viewer<TRes> get Viewer =>
      CopyWith$Query$FetchBasicUserInfo$Viewer.stub(_res);
}

const documentNodeQueryFetchBasicUserInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FetchBasicUserInfo'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'Viewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'about'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatar'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'medium'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'large'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'bannerImage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'donatorTier'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'donatorBadge'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'options'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'profileColor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'timezone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$FetchBasicUserInfo$Viewer {
  Query$FetchBasicUserInfo$Viewer({
    required this.id,
    required this.name,
    this.about,
    this.avatar,
    this.bannerImage,
    this.donatorTier,
    this.donatorBadge,
    this.options,
    required this.$__typename,
  });

  factory Query$FetchBasicUserInfo$Viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$about = json['about'];
    final l$avatar = json['avatar'];
    final l$bannerImage = json['bannerImage'];
    final l$donatorTier = json['donatorTier'];
    final l$donatorBadge = json['donatorBadge'];
    final l$options = json['options'];
    final l$$__typename = json['__typename'];
    return Query$FetchBasicUserInfo$Viewer(
      id: (l$id as int),
      name: (l$name as String),
      about: (l$about as String?),
      avatar: l$avatar == null
          ? null
          : Query$FetchBasicUserInfo$Viewer$avatar.fromJson(
              (l$avatar as Map<String, dynamic>)),
      bannerImage: (l$bannerImage as String?),
      donatorTier: (l$donatorTier as int?),
      donatorBadge: (l$donatorBadge as String?),
      options: l$options == null
          ? null
          : Query$FetchBasicUserInfo$Viewer$options.fromJson(
              (l$options as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String? about;

  final Query$FetchBasicUserInfo$Viewer$avatar? avatar;

  final String? bannerImage;

  final int? donatorTier;

  final String? donatorBadge;

  final Query$FetchBasicUserInfo$Viewer$options? options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$about = about;
    _resultData['about'] = l$about;
    final l$avatar = avatar;
    _resultData['avatar'] = l$avatar?.toJson();
    final l$bannerImage = bannerImage;
    _resultData['bannerImage'] = l$bannerImage;
    final l$donatorTier = donatorTier;
    _resultData['donatorTier'] = l$donatorTier;
    final l$donatorBadge = donatorBadge;
    _resultData['donatorBadge'] = l$donatorBadge;
    final l$options = options;
    _resultData['options'] = l$options?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$about = about;
    final l$avatar = avatar;
    final l$bannerImage = bannerImage;
    final l$donatorTier = donatorTier;
    final l$donatorBadge = donatorBadge;
    final l$options = options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$about,
      l$avatar,
      l$bannerImage,
      l$donatorTier,
      l$donatorBadge,
      l$options,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchBasicUserInfo$Viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$about = about;
    final lOther$about = other.about;
    if (l$about != lOther$about) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
      return false;
    }
    final l$bannerImage = bannerImage;
    final lOther$bannerImage = other.bannerImage;
    if (l$bannerImage != lOther$bannerImage) {
      return false;
    }
    final l$donatorTier = donatorTier;
    final lOther$donatorTier = other.donatorTier;
    if (l$donatorTier != lOther$donatorTier) {
      return false;
    }
    final l$donatorBadge = donatorBadge;
    final lOther$donatorBadge = other.donatorBadge;
    if (l$donatorBadge != lOther$donatorBadge) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options != lOther$options) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchBasicUserInfo$Viewer
    on Query$FetchBasicUserInfo$Viewer {
  CopyWith$Query$FetchBasicUserInfo$Viewer<Query$FetchBasicUserInfo$Viewer>
      get copyWith => CopyWith$Query$FetchBasicUserInfo$Viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchBasicUserInfo$Viewer<TRes> {
  factory CopyWith$Query$FetchBasicUserInfo$Viewer(
    Query$FetchBasicUserInfo$Viewer instance,
    TRes Function(Query$FetchBasicUserInfo$Viewer) then,
  ) = _CopyWithImpl$Query$FetchBasicUserInfo$Viewer;

  factory CopyWith$Query$FetchBasicUserInfo$Viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer;

  TRes call({
    int? id,
    String? name,
    String? about,
    Query$FetchBasicUserInfo$Viewer$avatar? avatar,
    String? bannerImage,
    int? donatorTier,
    String? donatorBadge,
    Query$FetchBasicUserInfo$Viewer$options? options,
    String? $__typename,
  });
  CopyWith$Query$FetchBasicUserInfo$Viewer$avatar<TRes> get avatar;
  CopyWith$Query$FetchBasicUserInfo$Viewer$options<TRes> get options;
}

class _CopyWithImpl$Query$FetchBasicUserInfo$Viewer<TRes>
    implements CopyWith$Query$FetchBasicUserInfo$Viewer<TRes> {
  _CopyWithImpl$Query$FetchBasicUserInfo$Viewer(
    this._instance,
    this._then,
  );

  final Query$FetchBasicUserInfo$Viewer _instance;

  final TRes Function(Query$FetchBasicUserInfo$Viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? about = _undefined,
    Object? avatar = _undefined,
    Object? bannerImage = _undefined,
    Object? donatorTier = _undefined,
    Object? donatorBadge = _undefined,
    Object? options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchBasicUserInfo$Viewer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        about: about == _undefined ? _instance.about : (about as String?),
        avatar: avatar == _undefined
            ? _instance.avatar
            : (avatar as Query$FetchBasicUserInfo$Viewer$avatar?),
        bannerImage: bannerImage == _undefined
            ? _instance.bannerImage
            : (bannerImage as String?),
        donatorTier: donatorTier == _undefined
            ? _instance.donatorTier
            : (donatorTier as int?),
        donatorBadge: donatorBadge == _undefined
            ? _instance.donatorBadge
            : (donatorBadge as String?),
        options: options == _undefined
            ? _instance.options
            : (options as Query$FetchBasicUserInfo$Viewer$options?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchBasicUserInfo$Viewer$avatar<TRes> get avatar {
    final local$avatar = _instance.avatar;
    return local$avatar == null
        ? CopyWith$Query$FetchBasicUserInfo$Viewer$avatar.stub(_then(_instance))
        : CopyWith$Query$FetchBasicUserInfo$Viewer$avatar(
            local$avatar, (e) => call(avatar: e));
  }

  CopyWith$Query$FetchBasicUserInfo$Viewer$options<TRes> get options {
    final local$options = _instance.options;
    return local$options == null
        ? CopyWith$Query$FetchBasicUserInfo$Viewer$options.stub(
            _then(_instance))
        : CopyWith$Query$FetchBasicUserInfo$Viewer$options(
            local$options, (e) => call(options: e));
  }
}

class _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer<TRes>
    implements CopyWith$Query$FetchBasicUserInfo$Viewer<TRes> {
  _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? about,
    Query$FetchBasicUserInfo$Viewer$avatar? avatar,
    String? bannerImage,
    int? donatorTier,
    String? donatorBadge,
    Query$FetchBasicUserInfo$Viewer$options? options,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchBasicUserInfo$Viewer$avatar<TRes> get avatar =>
      CopyWith$Query$FetchBasicUserInfo$Viewer$avatar.stub(_res);
  CopyWith$Query$FetchBasicUserInfo$Viewer$options<TRes> get options =>
      CopyWith$Query$FetchBasicUserInfo$Viewer$options.stub(_res);
}

class Query$FetchBasicUserInfo$Viewer$avatar {
  Query$FetchBasicUserInfo$Viewer$avatar({
    this.medium,
    this.large,
    required this.$__typename,
  });

  factory Query$FetchBasicUserInfo$Viewer$avatar.fromJson(
      Map<String, dynamic> json) {
    final l$medium = json['medium'];
    final l$large = json['large'];
    final l$$__typename = json['__typename'];
    return Query$FetchBasicUserInfo$Viewer$avatar(
      medium: (l$medium as String?),
      large: (l$large as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? medium;

  final String? large;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$medium = medium;
    _resultData['medium'] = l$medium;
    final l$large = large;
    _resultData['large'] = l$large;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$medium = medium;
    final l$large = large;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$medium,
      l$large,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchBasicUserInfo$Viewer$avatar) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) {
      return false;
    }
    final l$large = large;
    final lOther$large = other.large;
    if (l$large != lOther$large) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchBasicUserInfo$Viewer$avatar
    on Query$FetchBasicUserInfo$Viewer$avatar {
  CopyWith$Query$FetchBasicUserInfo$Viewer$avatar<
          Query$FetchBasicUserInfo$Viewer$avatar>
      get copyWith => CopyWith$Query$FetchBasicUserInfo$Viewer$avatar(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchBasicUserInfo$Viewer$avatar<TRes> {
  factory CopyWith$Query$FetchBasicUserInfo$Viewer$avatar(
    Query$FetchBasicUserInfo$Viewer$avatar instance,
    TRes Function(Query$FetchBasicUserInfo$Viewer$avatar) then,
  ) = _CopyWithImpl$Query$FetchBasicUserInfo$Viewer$avatar;

  factory CopyWith$Query$FetchBasicUserInfo$Viewer$avatar.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer$avatar;

  TRes call({
    String? medium,
    String? large,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchBasicUserInfo$Viewer$avatar<TRes>
    implements CopyWith$Query$FetchBasicUserInfo$Viewer$avatar<TRes> {
  _CopyWithImpl$Query$FetchBasicUserInfo$Viewer$avatar(
    this._instance,
    this._then,
  );

  final Query$FetchBasicUserInfo$Viewer$avatar _instance;

  final TRes Function(Query$FetchBasicUserInfo$Viewer$avatar) _then;

  static const _undefined = {};

  TRes call({
    Object? medium = _undefined,
    Object? large = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchBasicUserInfo$Viewer$avatar(
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        large: large == _undefined ? _instance.large : (large as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer$avatar<TRes>
    implements CopyWith$Query$FetchBasicUserInfo$Viewer$avatar<TRes> {
  _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer$avatar(this._res);

  TRes _res;

  call({
    String? medium,
    String? large,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchBasicUserInfo$Viewer$options {
  Query$FetchBasicUserInfo$Viewer$options({
    this.profileColor,
    this.timezone,
    required this.$__typename,
  });

  factory Query$FetchBasicUserInfo$Viewer$options.fromJson(
      Map<String, dynamic> json) {
    final l$profileColor = json['profileColor'];
    final l$timezone = json['timezone'];
    final l$$__typename = json['__typename'];
    return Query$FetchBasicUserInfo$Viewer$options(
      profileColor: (l$profileColor as String?),
      timezone: (l$timezone as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? profileColor;

  final String? timezone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileColor = profileColor;
    _resultData['profileColor'] = l$profileColor;
    final l$timezone = timezone;
    _resultData['timezone'] = l$timezone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileColor = profileColor;
    final l$timezone = timezone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$profileColor,
      l$timezone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchBasicUserInfo$Viewer$options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileColor = profileColor;
    final lOther$profileColor = other.profileColor;
    if (l$profileColor != lOther$profileColor) {
      return false;
    }
    final l$timezone = timezone;
    final lOther$timezone = other.timezone;
    if (l$timezone != lOther$timezone) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchBasicUserInfo$Viewer$options
    on Query$FetchBasicUserInfo$Viewer$options {
  CopyWith$Query$FetchBasicUserInfo$Viewer$options<
          Query$FetchBasicUserInfo$Viewer$options>
      get copyWith => CopyWith$Query$FetchBasicUserInfo$Viewer$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchBasicUserInfo$Viewer$options<TRes> {
  factory CopyWith$Query$FetchBasicUserInfo$Viewer$options(
    Query$FetchBasicUserInfo$Viewer$options instance,
    TRes Function(Query$FetchBasicUserInfo$Viewer$options) then,
  ) = _CopyWithImpl$Query$FetchBasicUserInfo$Viewer$options;

  factory CopyWith$Query$FetchBasicUserInfo$Viewer$options.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer$options;

  TRes call({
    String? profileColor,
    String? timezone,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchBasicUserInfo$Viewer$options<TRes>
    implements CopyWith$Query$FetchBasicUserInfo$Viewer$options<TRes> {
  _CopyWithImpl$Query$FetchBasicUserInfo$Viewer$options(
    this._instance,
    this._then,
  );

  final Query$FetchBasicUserInfo$Viewer$options _instance;

  final TRes Function(Query$FetchBasicUserInfo$Viewer$options) _then;

  static const _undefined = {};

  TRes call({
    Object? profileColor = _undefined,
    Object? timezone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchBasicUserInfo$Viewer$options(
        profileColor: profileColor == _undefined
            ? _instance.profileColor
            : (profileColor as String?),
        timezone:
            timezone == _undefined ? _instance.timezone : (timezone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer$options<TRes>
    implements CopyWith$Query$FetchBasicUserInfo$Viewer$options<TRes> {
  _CopyWithStubImpl$Query$FetchBasicUserInfo$Viewer$options(this._res);

  TRes _res;

  call({
    String? profileColor,
    String? timezone,
    String? $__typename,
  }) =>
      _res;
}
