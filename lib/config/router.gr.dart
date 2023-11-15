// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:counterapp/pages/bloC/counter_view.dart' as _i3;
import 'package:counterapp/pages/characters/char_view.dart' as _i1;
import 'package:counterapp/pages/dashboard.dart' as _i4;
import 'package:counterapp/pages/redux/counter_screen.dart' as _i2;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CharacterView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CharacterView(),
      );
    },
    CounterRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CounterScreen(),
      );
    },
    CounterView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CounterView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterView]
class CharacterView extends _i5.PageRouteInfo<void> {
  const CharacterView({List<_i5.PageRouteInfo>? children})
      : super(
          CharacterView.name,
          initialChildren: children,
        );

  static const String name = 'CharacterView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CounterScreen]
class CounterRoute extends _i5.PageRouteInfo<void> {
  const CounterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CounterView]
class CounterView extends _i5.PageRouteInfo<void> {
  const CounterView({List<_i5.PageRouteInfo>? children})
      : super(
          CounterView.name,
          initialChildren: children,
        );

  static const String name = 'CounterView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
