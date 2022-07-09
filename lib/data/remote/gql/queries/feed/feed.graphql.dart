import '../../schema/schema.graphql.dart';
import 'package:gql/ast.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feed.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$FetchFeed {
  Variables$Query$FetchFeed({required this.isFollowing, required this.page});

  @override
  factory Variables$Query$FetchFeed.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$FetchFeedFromJson(json);

  final bool isFollowing;

  final int page;

  Map<String, dynamic> toJson() => _$Variables$Query$FetchFeedToJson(this);
  int get hashCode {
    final l$isFollowing = isFollowing;
    final l$page = page;
    return Object.hashAll([l$isFollowing, l$page]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$FetchFeed) ||
        runtimeType != other.runtimeType) return false;
    final l$isFollowing = isFollowing;
    final lOther$isFollowing = other.isFollowing;
    if (l$isFollowing != lOther$isFollowing) return false;
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) return false;
    return true;
  }

  Variables$Query$FetchFeed copyWith({bool? isFollowing, int? page}) =>
      Variables$Query$FetchFeed(
          isFollowing: isFollowing == null ? this.isFollowing : isFollowing,
          page: page == null ? this.page : page);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed {
  Query$FetchFeed({this.Page, required this.$__typename});

  @override
  factory Query$FetchFeed.fromJson(Map<String, dynamic> json) =>
      _$Query$FetchFeedFromJson(json);

  final Query$FetchFeed$Page? Page;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$FetchFeedToJson(this);
  int get hashCode {
    final l$Page = Page;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Page, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed) || runtimeType != other.runtimeType)
      return false;
    final l$Page = Page;
    final lOther$Page = other.Page;
    if (l$Page != lOther$Page) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed on Query$FetchFeed {
  Query$FetchFeed copyWith(
          {Query$FetchFeed$Page? Function()? Page, String? $__typename}) =>
      Query$FetchFeed(
          Page: Page == null ? this.Page : Page(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const documentNodeQueryFetchFeed = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FetchFeed'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'isFollowing')),
            type: NamedTypeNode(
                name: NameNode(value: 'Boolean'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'page')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'Page'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'page'),
                  value: VariableNode(name: NameNode(value: 'page'))),
              ArgumentNode(
                  name: NameNode(value: 'perPage'),
                  value: IntValueNode(value: '50'))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'activities'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'isFollowing'),
                        value:
                            VariableNode(name: NameNode(value: 'isFollowing'))),
                    ArgumentNode(
                        name: NameNode(value: 'sort'),
                        value: EnumValueNode(name: NameNode(value: 'ID_DESC')))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                        typeCondition: TypeConditionNode(
                            on: NamedTypeNode(
                                name: NameNode(value: 'TextActivity'),
                                isNonNull: false)),
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'type'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'replyCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'text'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'likeCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'isLiked'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'isPinned'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'createdAt'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'replies'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'user'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'id'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'name'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'avatar'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FieldNode(
                                                name: NameNode(value: 'medium'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null),
                                            FieldNode(
                                                name: NameNode(
                                                    value: '__typename'),
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
                          FieldNode(
                              name: NameNode(value: 'likes'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'name'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
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
                              name: NameNode(value: 'user'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'name'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
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
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: '__typename'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null)
                                    ])),
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
                    InlineFragmentNode(
                        typeCondition: TypeConditionNode(
                            on: NamedTypeNode(
                                name: NameNode(value: 'ListActivity'),
                                isNonNull: false)),
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'type'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'replyCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'likeCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'isLiked'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'isPinned'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'createdAt'),
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
                              name: NameNode(value: 'progress'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'media'),
                              alias: null,
                              arguments: [],
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
                                          name:
                                              NameNode(value: 'userPreferred'),
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
                                    name: NameNode(value: 'description'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'type'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'coverImage'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'color'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'medium'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'large'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'extraLarge'),
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
                              name: NameNode(value: 'replies'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'user'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'id'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'name'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'avatar'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FieldNode(
                                                name: NameNode(value: 'medium'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null),
                                            FieldNode(
                                                name: NameNode(
                                                    value: '__typename'),
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
                          FieldNode(
                              name: NameNode(value: 'likes'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'name'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
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
                              name: NameNode(value: 'user'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'name'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
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
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: '__typename'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null)
                                    ])),
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
class Query$FetchFeed$Page {
  Query$FetchFeed$Page({this.activities, required this.$__typename});

  @override
  factory Query$FetchFeed$Page.fromJson(Map<String, dynamic> json) =>
      _$Query$FetchFeed$PageFromJson(json);

  final List<Query$FetchFeed$Page$activities?>? activities;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$FetchFeed$PageToJson(this);
  int get hashCode {
    final l$activities = activities;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$activities == null ? null : Object.hashAll(l$activities.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page) || runtimeType != other.runtimeType)
      return false;
    final l$activities = activities;
    final lOther$activities = other.activities;
    if (l$activities != null && lOther$activities != null) {
      if (l$activities.length != lOther$activities.length) return false;
      for (int i = 0; i < l$activities.length; i++) {
        final l$activities$entry = l$activities[i];
        final lOther$activities$entry = lOther$activities[i];
        if (l$activities$entry != lOther$activities$entry) return false;
      }
    } else if (l$activities != lOther$activities) {
      return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page on Query$FetchFeed$Page {
  Query$FetchFeed$Page copyWith(
          {List<Query$FetchFeed$Page$activities?>? Function()? activities,
          String? $__typename}) =>
      Query$FetchFeed$Page(
          activities: activities == null ? this.activities : activities(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities {
  Query$FetchFeed$Page$activities({required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "TextActivity":
        return Query$FetchFeed$Page$activities$$TextActivity.fromJson(json);
      case "ListActivity":
        return Query$FetchFeed$Page$activities$$ListActivity.fromJson(json);
      default:
        return _$Query$FetchFeed$Page$activitiesFromJson(json);
    }
  }

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activitiesToJson(this);
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities) ||
        runtimeType != other.runtimeType) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities
    on Query$FetchFeed$Page$activities {
  Query$FetchFeed$Page$activities copyWith({String? $__typename}) =>
      Query$FetchFeed$Page$activities(
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity
    implements Query$FetchFeed$Page$activities {
  Query$FetchFeed$Page$activities$$TextActivity(
      {required this.$__typename,
      required this.id,
      this.type,
      required this.replyCount,
      this.text,
      required this.likeCount,
      this.isLiked,
      this.isPinned,
      required this.createdAt,
      this.replies,
      this.likes,
      this.user});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivityFromJson(json);

  @JsonKey(name: '__typename')
  final String $__typename;

  final int id;

  @JsonKey(unknownEnumValue: Enum$ActivityType.$unknown)
  final Enum$ActivityType? type;

  final int replyCount;

  final String? text;

  final int likeCount;

  final bool? isLiked;

  final bool? isPinned;

  final int createdAt;

  final List<Query$FetchFeed$Page$activities$$TextActivity$replies?>? replies;

  final List<Query$FetchFeed$Page$activities$$TextActivity$likes?>? likes;

  final Query$FetchFeed$Page$activities$$TextActivity$user? user;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivityToJson(this);
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$type = type;
    final l$replyCount = replyCount;
    final l$text = text;
    final l$likeCount = likeCount;
    final l$isLiked = isLiked;
    final l$isPinned = isPinned;
    final l$createdAt = createdAt;
    final l$replies = replies;
    final l$likes = likes;
    final l$user = user;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$type,
      l$replyCount,
      l$text,
      l$likeCount,
      l$isLiked,
      l$isPinned,
      l$createdAt,
      l$replies == null ? null : Object.hashAll(l$replies.map((v) => v)),
      l$likes == null ? null : Object.hashAll(l$likes.map((v) => v)),
      l$user
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$TextActivity) ||
        runtimeType != other.runtimeType) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) return false;
    final l$replyCount = replyCount;
    final lOther$replyCount = other.replyCount;
    if (l$replyCount != lOther$replyCount) return false;
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) return false;
    final l$likeCount = likeCount;
    final lOther$likeCount = other.likeCount;
    if (l$likeCount != lOther$likeCount) return false;
    final l$isLiked = isLiked;
    final lOther$isLiked = other.isLiked;
    if (l$isLiked != lOther$isLiked) return false;
    final l$isPinned = isPinned;
    final lOther$isPinned = other.isPinned;
    if (l$isPinned != lOther$isPinned) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$replies = replies;
    final lOther$replies = other.replies;
    if (l$replies != null && lOther$replies != null) {
      if (l$replies.length != lOther$replies.length) return false;
      for (int i = 0; i < l$replies.length; i++) {
        final l$replies$entry = l$replies[i];
        final lOther$replies$entry = lOther$replies[i];
        if (l$replies$entry != lOther$replies$entry) return false;
      }
    } else if (l$replies != lOther$replies) {
      return false;
    }

    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != null && lOther$likes != null) {
      if (l$likes.length != lOther$likes.length) return false;
      for (int i = 0; i < l$likes.length; i++) {
        final l$likes$entry = l$likes[i];
        final lOther$likes$entry = lOther$likes[i];
        if (l$likes$entry != lOther$likes$entry) return false;
      }
    } else if (l$likes != lOther$likes) {
      return false;
    }

    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity
    on Query$FetchFeed$Page$activities$$TextActivity {
  Query$FetchFeed$Page$activities$$TextActivity copyWith(
          {String? $__typename,
          int? id,
          Enum$ActivityType? Function()? type,
          int? replyCount,
          String? Function()? text,
          int? likeCount,
          bool? Function()? isLiked,
          bool? Function()? isPinned,
          int? createdAt,
          List<Query$FetchFeed$Page$activities$$TextActivity$replies?>?
                  Function()?
              replies,
          List<Query$FetchFeed$Page$activities$$TextActivity$likes?>?
                  Function()?
              likes,
          Query$FetchFeed$Page$activities$$TextActivity$user? Function()?
              user}) =>
      Query$FetchFeed$Page$activities$$TextActivity(
          $__typename: $__typename == null ? this.$__typename : $__typename,
          id: id == null ? this.id : id,
          type: type == null ? this.type : type(),
          replyCount: replyCount == null ? this.replyCount : replyCount,
          text: text == null ? this.text : text(),
          likeCount: likeCount == null ? this.likeCount : likeCount,
          isLiked: isLiked == null ? this.isLiked : isLiked(),
          isPinned: isPinned == null ? this.isPinned : isPinned(),
          createdAt: createdAt == null ? this.createdAt : createdAt,
          replies: replies == null ? this.replies : replies(),
          likes: likes == null ? this.likes : likes(),
          user: user == null ? this.user : user());
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$replies {
  Query$FetchFeed$Page$activities$$TextActivity$replies(
      {required this.id, this.user, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$replies.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$repliesFromJson(json);

  final int id;

  final Query$FetchFeed$Page$activities$$TextActivity$replies$user? user;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$repliesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$TextActivity$replies) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$replies
    on Query$FetchFeed$Page$activities$$TextActivity$replies {
  Query$FetchFeed$Page$activities$$TextActivity$replies copyWith(
          {int? id,
          Query$FetchFeed$Page$activities$$TextActivity$replies$user?
                  Function()?
              user,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$replies(
          id: id == null ? this.id : id,
          user: user == null ? this.user : user(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$replies$user {
  Query$FetchFeed$Page$activities$$TextActivity$replies$user(
      {required this.id,
      required this.name,
      this.avatar,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$replies$user.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$replies$userFromJson(
          json);

  final int id;

  final String name;

  final Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar?
      avatar;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$replies$userToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$avatar, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$TextActivity$replies$user) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$replies$user
    on Query$FetchFeed$Page$activities$$TextActivity$replies$user {
  Query$FetchFeed$Page$activities$$TextActivity$replies$user copyWith(
          {int? id,
          String? name,
          Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar?
                  Function()?
              avatar,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$replies$user(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          avatar: avatar == null ? this.avatar : avatar(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar {
  Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar(
      {this.medium, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatarFromJson(
          json);

  final String? medium;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatarToJson(
          this);
  int get hashCode {
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([l$medium, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar) ||
        runtimeType != other.runtimeType) return false;
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar
    on Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar {
  Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar copyWith(
          {String? Function()? medium, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$replies$user$avatar(
          medium: medium == null ? this.medium : medium(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$likes {
  Query$FetchFeed$Page$activities$$TextActivity$likes(
      {required this.id,
      required this.name,
      this.avatar,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$likes.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$likesFromJson(json);

  final int id;

  final String name;

  final Query$FetchFeed$Page$activities$$TextActivity$likes$avatar? avatar;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$likesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$avatar, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$TextActivity$likes) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$likes
    on Query$FetchFeed$Page$activities$$TextActivity$likes {
  Query$FetchFeed$Page$activities$$TextActivity$likes copyWith(
          {int? id,
          String? name,
          Query$FetchFeed$Page$activities$$TextActivity$likes$avatar?
                  Function()?
              avatar,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$likes(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          avatar: avatar == null ? this.avatar : avatar(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$likes$avatar {
  Query$FetchFeed$Page$activities$$TextActivity$likes$avatar(
      {this.medium, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$likes$avatar.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$likes$avatarFromJson(
          json);

  final String? medium;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$likes$avatarToJson(this);
  int get hashCode {
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([l$medium, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$TextActivity$likes$avatar) ||
        runtimeType != other.runtimeType) return false;
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$likes$avatar
    on Query$FetchFeed$Page$activities$$TextActivity$likes$avatar {
  Query$FetchFeed$Page$activities$$TextActivity$likes$avatar copyWith(
          {String? Function()? medium, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$likes$avatar(
          medium: medium == null ? this.medium : medium(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$user {
  Query$FetchFeed$Page$activities$$TextActivity$user(
      {required this.id,
      required this.name,
      this.options,
      this.avatar,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$user.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$userFromJson(json);

  final int id;

  final String name;

  final Query$FetchFeed$Page$activities$$TextActivity$user$options? options;

  final Query$FetchFeed$Page$activities$$TextActivity$user$avatar? avatar;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$userToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$options = options;
    final l$avatar = avatar;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$options, l$avatar, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$TextActivity$user) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$options = options;
    final lOther$options = other.options;
    if (l$options != lOther$options) return false;
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$user
    on Query$FetchFeed$Page$activities$$TextActivity$user {
  Query$FetchFeed$Page$activities$$TextActivity$user copyWith(
          {int? id,
          String? name,
          Query$FetchFeed$Page$activities$$TextActivity$user$options?
                  Function()?
              options,
          Query$FetchFeed$Page$activities$$TextActivity$user$avatar? Function()?
              avatar,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$user(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          options: options == null ? this.options : options(),
          avatar: avatar == null ? this.avatar : avatar(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$user$options {
  Query$FetchFeed$Page$activities$$TextActivity$user$options(
      {this.profileColor, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$user$options.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$user$optionsFromJson(
          json);

  final String? profileColor;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$user$optionsToJson(this);
  int get hashCode {
    final l$profileColor = profileColor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileColor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$TextActivity$user$options) ||
        runtimeType != other.runtimeType) return false;
    final l$profileColor = profileColor;
    final lOther$profileColor = other.profileColor;
    if (l$profileColor != lOther$profileColor) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$user$options
    on Query$FetchFeed$Page$activities$$TextActivity$user$options {
  Query$FetchFeed$Page$activities$$TextActivity$user$options copyWith(
          {String? Function()? profileColor, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$user$options(
          profileColor:
              profileColor == null ? this.profileColor : profileColor(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$TextActivity$user$avatar {
  Query$FetchFeed$Page$activities$$TextActivity$user$avatar(
      {this.medium, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$TextActivity$user$avatar.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$TextActivity$user$avatarFromJson(json);

  final String? medium;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$TextActivity$user$avatarToJson(this);
  int get hashCode {
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([l$medium, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$TextActivity$user$avatar) ||
        runtimeType != other.runtimeType) return false;
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$TextActivity$user$avatar
    on Query$FetchFeed$Page$activities$$TextActivity$user$avatar {
  Query$FetchFeed$Page$activities$$TextActivity$user$avatar copyWith(
          {String? Function()? medium, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$TextActivity$user$avatar(
          medium: medium == null ? this.medium : medium(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity
    implements Query$FetchFeed$Page$activities {
  Query$FetchFeed$Page$activities$$ListActivity(
      {required this.$__typename,
      required this.id,
      this.type,
      required this.replyCount,
      required this.likeCount,
      this.isLiked,
      this.isPinned,
      required this.createdAt,
      this.status,
      this.progress,
      this.media,
      this.replies,
      this.likes,
      this.user});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivityFromJson(json);

  @JsonKey(name: '__typename')
  final String $__typename;

  final int id;

  @JsonKey(unknownEnumValue: Enum$ActivityType.$unknown)
  final Enum$ActivityType? type;

  final int replyCount;

  final int likeCount;

  final bool? isLiked;

  final bool? isPinned;

  final int createdAt;

  final String? status;

  final String? progress;

  final Query$FetchFeed$Page$activities$$ListActivity$media? media;

  final List<Query$FetchFeed$Page$activities$$ListActivity$replies?>? replies;

  final List<Query$FetchFeed$Page$activities$$ListActivity$likes?>? likes;

  final Query$FetchFeed$Page$activities$$ListActivity$user? user;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivityToJson(this);
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$type = type;
    final l$replyCount = replyCount;
    final l$likeCount = likeCount;
    final l$isLiked = isLiked;
    final l$isPinned = isPinned;
    final l$createdAt = createdAt;
    final l$status = status;
    final l$progress = progress;
    final l$media = media;
    final l$replies = replies;
    final l$likes = likes;
    final l$user = user;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$type,
      l$replyCount,
      l$likeCount,
      l$isLiked,
      l$isPinned,
      l$createdAt,
      l$status,
      l$progress,
      l$media,
      l$replies == null ? null : Object.hashAll(l$replies.map((v) => v)),
      l$likes == null ? null : Object.hashAll(l$likes.map((v) => v)),
      l$user
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$ListActivity) ||
        runtimeType != other.runtimeType) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) return false;
    final l$replyCount = replyCount;
    final lOther$replyCount = other.replyCount;
    if (l$replyCount != lOther$replyCount) return false;
    final l$likeCount = likeCount;
    final lOther$likeCount = other.likeCount;
    if (l$likeCount != lOther$likeCount) return false;
    final l$isLiked = isLiked;
    final lOther$isLiked = other.isLiked;
    if (l$isLiked != lOther$isLiked) return false;
    final l$isPinned = isPinned;
    final lOther$isPinned = other.isPinned;
    if (l$isPinned != lOther$isPinned) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) return false;
    final l$media = media;
    final lOther$media = other.media;
    if (l$media != lOther$media) return false;
    final l$replies = replies;
    final lOther$replies = other.replies;
    if (l$replies != null && lOther$replies != null) {
      if (l$replies.length != lOther$replies.length) return false;
      for (int i = 0; i < l$replies.length; i++) {
        final l$replies$entry = l$replies[i];
        final lOther$replies$entry = lOther$replies[i];
        if (l$replies$entry != lOther$replies$entry) return false;
      }
    } else if (l$replies != lOther$replies) {
      return false;
    }

    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != null && lOther$likes != null) {
      if (l$likes.length != lOther$likes.length) return false;
      for (int i = 0; i < l$likes.length; i++) {
        final l$likes$entry = l$likes[i];
        final lOther$likes$entry = lOther$likes[i];
        if (l$likes$entry != lOther$likes$entry) return false;
      }
    } else if (l$likes != lOther$likes) {
      return false;
    }

    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity
    on Query$FetchFeed$Page$activities$$ListActivity {
  Query$FetchFeed$Page$activities$$ListActivity copyWith(
          {String? $__typename,
          int? id,
          Enum$ActivityType? Function()? type,
          int? replyCount,
          int? likeCount,
          bool? Function()? isLiked,
          bool? Function()? isPinned,
          int? createdAt,
          String? Function()? status,
          String? Function()? progress,
          Query$FetchFeed$Page$activities$$ListActivity$media? Function()?
              media,
          List<Query$FetchFeed$Page$activities$$ListActivity$replies?>?
                  Function()?
              replies,
          List<Query$FetchFeed$Page$activities$$ListActivity$likes?>?
                  Function()?
              likes,
          Query$FetchFeed$Page$activities$$ListActivity$user? Function()?
              user}) =>
      Query$FetchFeed$Page$activities$$ListActivity(
          $__typename: $__typename == null ? this.$__typename : $__typename,
          id: id == null ? this.id : id,
          type: type == null ? this.type : type(),
          replyCount: replyCount == null ? this.replyCount : replyCount,
          likeCount: likeCount == null ? this.likeCount : likeCount,
          isLiked: isLiked == null ? this.isLiked : isLiked(),
          isPinned: isPinned == null ? this.isPinned : isPinned(),
          createdAt: createdAt == null ? this.createdAt : createdAt,
          status: status == null ? this.status : status(),
          progress: progress == null ? this.progress : progress(),
          media: media == null ? this.media : media(),
          replies: replies == null ? this.replies : replies(),
          likes: likes == null ? this.likes : likes(),
          user: user == null ? this.user : user());
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$media {
  Query$FetchFeed$Page$activities$$ListActivity$media(
      {required this.id,
      this.title,
      this.description,
      this.type,
      this.coverImage,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$media.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$mediaFromJson(json);

  final int id;

  final Query$FetchFeed$Page$activities$$ListActivity$media$title? title;

  final String? description;

  @JsonKey(unknownEnumValue: Enum$MediaType.$unknown)
  final Enum$MediaType? type;

  final Query$FetchFeed$Page$activities$$ListActivity$media$coverImage?
      coverImage;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$mediaToJson(this);
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$type = type;
    final l$coverImage = coverImage;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [l$id, l$title, l$description, l$type, l$coverImage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$ListActivity$media) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) return false;
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) return false;
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) return false;
    final l$coverImage = coverImage;
    final lOther$coverImage = other.coverImage;
    if (l$coverImage != lOther$coverImage) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$media
    on Query$FetchFeed$Page$activities$$ListActivity$media {
  Query$FetchFeed$Page$activities$$ListActivity$media copyWith(
          {int? id,
          Query$FetchFeed$Page$activities$$ListActivity$media$title? Function()?
              title,
          String? Function()? description,
          Enum$MediaType? Function()? type,
          Query$FetchFeed$Page$activities$$ListActivity$media$coverImage?
                  Function()?
              coverImage,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$media(
          id: id == null ? this.id : id,
          title: title == null ? this.title : title(),
          description: description == null ? this.description : description(),
          type: type == null ? this.type : type(),
          coverImage: coverImage == null ? this.coverImage : coverImage(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$media$title {
  Query$FetchFeed$Page$activities$$ListActivity$media$title(
      {this.romaji,
      this.english,
      this.native,
      this.userPreferred,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$media$title.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$media$titleFromJson(json);

  final String? romaji;

  final String? english;

  final String? native;

  final String? userPreferred;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$media$titleToJson(this);
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
    if (!(other is Query$FetchFeed$Page$activities$$ListActivity$media$title) ||
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

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$media$title
    on Query$FetchFeed$Page$activities$$ListActivity$media$title {
  Query$FetchFeed$Page$activities$$ListActivity$media$title copyWith(
          {String? Function()? romaji,
          String? Function()? english,
          String? Function()? native,
          String? Function()? userPreferred,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$media$title(
          romaji: romaji == null ? this.romaji : romaji(),
          english: english == null ? this.english : english(),
          native: native == null ? this.native : native(),
          userPreferred:
              userPreferred == null ? this.userPreferred : userPreferred(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$media$coverImage {
  Query$FetchFeed$Page$activities$$ListActivity$media$coverImage(
      {this.color,
      this.medium,
      this.large,
      this.extraLarge,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$media$coverImage.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$media$coverImageFromJson(
          json);

  final String? color;

  final String? medium;

  final String? large;

  final String? extraLarge;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$media$coverImageToJson(
          this);
  int get hashCode {
    final l$color = color;
    final l$medium = medium;
    final l$large = large;
    final l$extraLarge = extraLarge;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [l$color, l$medium, l$large, l$extraLarge, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$ListActivity$media$coverImage) ||
        runtimeType != other.runtimeType) return false;
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) return false;
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) return false;
    final l$large = large;
    final lOther$large = other.large;
    if (l$large != lOther$large) return false;
    final l$extraLarge = extraLarge;
    final lOther$extraLarge = other.extraLarge;
    if (l$extraLarge != lOther$extraLarge) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$media$coverImage
    on Query$FetchFeed$Page$activities$$ListActivity$media$coverImage {
  Query$FetchFeed$Page$activities$$ListActivity$media$coverImage copyWith(
          {String? Function()? color,
          String? Function()? medium,
          String? Function()? large,
          String? Function()? extraLarge,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$media$coverImage(
          color: color == null ? this.color : color(),
          medium: medium == null ? this.medium : medium(),
          large: large == null ? this.large : large(),
          extraLarge: extraLarge == null ? this.extraLarge : extraLarge(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$replies {
  Query$FetchFeed$Page$activities$$ListActivity$replies(
      {required this.id, this.user, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$replies.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$repliesFromJson(json);

  final int id;

  final Query$FetchFeed$Page$activities$$ListActivity$replies$user? user;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$repliesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$ListActivity$replies) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$replies
    on Query$FetchFeed$Page$activities$$ListActivity$replies {
  Query$FetchFeed$Page$activities$$ListActivity$replies copyWith(
          {int? id,
          Query$FetchFeed$Page$activities$$ListActivity$replies$user?
                  Function()?
              user,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$replies(
          id: id == null ? this.id : id,
          user: user == null ? this.user : user(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$replies$user {
  Query$FetchFeed$Page$activities$$ListActivity$replies$user(
      {required this.id,
      required this.name,
      this.avatar,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$replies$user.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$replies$userFromJson(
          json);

  final int id;

  final String name;

  final Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar?
      avatar;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$replies$userToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$avatar, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$ListActivity$replies$user) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$replies$user
    on Query$FetchFeed$Page$activities$$ListActivity$replies$user {
  Query$FetchFeed$Page$activities$$ListActivity$replies$user copyWith(
          {int? id,
          String? name,
          Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar?
                  Function()?
              avatar,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$replies$user(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          avatar: avatar == null ? this.avatar : avatar(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar {
  Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar(
      {this.medium, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatarFromJson(
          json);

  final String? medium;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatarToJson(
          this);
  int get hashCode {
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([l$medium, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar) ||
        runtimeType != other.runtimeType) return false;
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar
    on Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar {
  Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar copyWith(
          {String? Function()? medium, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$replies$user$avatar(
          medium: medium == null ? this.medium : medium(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$likes {
  Query$FetchFeed$Page$activities$$ListActivity$likes(
      {required this.id,
      required this.name,
      this.avatar,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$likes.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$likesFromJson(json);

  final int id;

  final String name;

  final Query$FetchFeed$Page$activities$$ListActivity$likes$avatar? avatar;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$likesToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$avatar, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$ListActivity$likes) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$likes
    on Query$FetchFeed$Page$activities$$ListActivity$likes {
  Query$FetchFeed$Page$activities$$ListActivity$likes copyWith(
          {int? id,
          String? name,
          Query$FetchFeed$Page$activities$$ListActivity$likes$avatar?
                  Function()?
              avatar,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$likes(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          avatar: avatar == null ? this.avatar : avatar(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$likes$avatar {
  Query$FetchFeed$Page$activities$$ListActivity$likes$avatar(
      {this.medium, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$likes$avatar.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$likes$avatarFromJson(
          json);

  final String? medium;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$likes$avatarToJson(this);
  int get hashCode {
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([l$medium, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$ListActivity$likes$avatar) ||
        runtimeType != other.runtimeType) return false;
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$likes$avatar
    on Query$FetchFeed$Page$activities$$ListActivity$likes$avatar {
  Query$FetchFeed$Page$activities$$ListActivity$likes$avatar copyWith(
          {String? Function()? medium, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$likes$avatar(
          medium: medium == null ? this.medium : medium(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$user {
  Query$FetchFeed$Page$activities$$ListActivity$user(
      {required this.id,
      required this.name,
      this.options,
      this.avatar,
      required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$user.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$userFromJson(json);

  final int id;

  final String name;

  final Query$FetchFeed$Page$activities$$ListActivity$user$options? options;

  final Query$FetchFeed$Page$activities$$ListActivity$user$avatar? avatar;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$userToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$options = options;
    final l$avatar = avatar;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$options, l$avatar, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$ListActivity$user) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$options = options;
    final lOther$options = other.options;
    if (l$options != lOther$options) return false;
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$user
    on Query$FetchFeed$Page$activities$$ListActivity$user {
  Query$FetchFeed$Page$activities$$ListActivity$user copyWith(
          {int? id,
          String? name,
          Query$FetchFeed$Page$activities$$ListActivity$user$options?
                  Function()?
              options,
          Query$FetchFeed$Page$activities$$ListActivity$user$avatar? Function()?
              avatar,
          String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$user(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          options: options == null ? this.options : options(),
          avatar: avatar == null ? this.avatar : avatar(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$user$options {
  Query$FetchFeed$Page$activities$$ListActivity$user$options(
      {this.profileColor, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$user$options.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$user$optionsFromJson(
          json);

  final String? profileColor;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$user$optionsToJson(this);
  int get hashCode {
    final l$profileColor = profileColor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileColor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other
            is Query$FetchFeed$Page$activities$$ListActivity$user$options) ||
        runtimeType != other.runtimeType) return false;
    final l$profileColor = profileColor;
    final lOther$profileColor = other.profileColor;
    if (l$profileColor != lOther$profileColor) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$user$options
    on Query$FetchFeed$Page$activities$$ListActivity$user$options {
  Query$FetchFeed$Page$activities$$ListActivity$user$options copyWith(
          {String? Function()? profileColor, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$user$options(
          profileColor:
              profileColor == null ? this.profileColor : profileColor(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchFeed$Page$activities$$ListActivity$user$avatar {
  Query$FetchFeed$Page$activities$$ListActivity$user$avatar(
      {this.medium, required this.$__typename});

  @override
  factory Query$FetchFeed$Page$activities$$ListActivity$user$avatar.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchFeed$Page$activities$$ListActivity$user$avatarFromJson(json);

  final String? medium;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchFeed$Page$activities$$ListActivity$user$avatarToJson(this);
  int get hashCode {
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([l$medium, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchFeed$Page$activities$$ListActivity$user$avatar) ||
        runtimeType != other.runtimeType) return false;
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$FetchFeed$Page$activities$$ListActivity$user$avatar
    on Query$FetchFeed$Page$activities$$ListActivity$user$avatar {
  Query$FetchFeed$Page$activities$$ListActivity$user$avatar copyWith(
          {String? Function()? medium, String? $__typename}) =>
      Query$FetchFeed$Page$activities$$ListActivity$user$avatar(
          medium: medium == null ? this.medium : medium(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
