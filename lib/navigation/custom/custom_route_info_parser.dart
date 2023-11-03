// ignore: implementation_imports
import 'package:auto_route/src/matcher/route_matcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomRouteInfoParser extends RouteInformationParser<UrlState> {
  final RouteMatcher _matcher;

  CustomRouteInfoParser(this._matcher);

  Uri _fixAccessToken(Uri uri) {
    return Uri.parse(
      uri.toString().replaceAll('#access_token=', '?access_token='),
    );
  }

  @override
  Future<UrlState> parseRouteInformation(RouteInformation routeInformation) {
    final resolvedUri = _fixAccessToken(routeInformation.uri);
    var matches = _matcher.matchUri(resolvedUri, includePrefixMatches: false);
    return SynchronousFuture<UrlState>(
      UrlState(routeInformation.uri, matches ?? const [],
          pathState: routeInformation.state),
    );
  }

  @override
  RouteInformation restoreRouteInformation(UrlState configuration) {
    return AutoRouteInformation(
      uri: configuration.url.isEmpty ? Uri(path: '/') : configuration.uri,
      replace: configuration.shouldReplace,
      state: configuration.pathState,
    );
  }
}
