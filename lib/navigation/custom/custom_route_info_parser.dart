import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomRouteInfoParser extends RouteInformationParser<UrlState> {
  final DefaultRouteParser defaultParser;

  CustomRouteInfoParser(this.defaultParser);

  @override
  Future<UrlState> parseRouteInformation(RouteInformation routeInformation) {
    final location = routeInformation.location ?? '';
    return defaultParser.parseRouteInformation(
      RouteInformation(
        /// Make the data in the fragment parsable by [Uri.parse].
        location: location.replaceAll('#access_token=', '?access_token='),
        state: routeInformation.state,
      ),
    );
  }

  @override
  RouteInformation restoreRouteInformation(UrlState configuration) {
    return defaultParser.restoreRouteInformation(configuration);
  }
}
