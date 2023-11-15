import 'package:auto_route/auto_route.dart';
import 'package:counterapp/config/router.gr.dart';

@AutoRouterConfig()      
class AppRouter extends $AppRouter {      
   
 @override      
 List<AutoRoute> get routes => [      
  /// routes go here
  AutoRoute(
    page: DashboardRoute.page, 
    initial: true,
    children: [
      AutoRoute(page: CounterView.page),
      AutoRoute(page: CounterRoute.page),
      AutoRoute(page: CharacterView.page)  
    ],
    ),  
  ];    
}    
