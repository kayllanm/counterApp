import 'package:auto_route/auto_route.dart';
import 'package:counterapp/config/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
                
  @override                
  Widget build(BuildContext context) {                
    return AutoTabsRouter(                
    // list of your tab routes                
    // routes used here must be declared as children                
    // routes of /dashboard                 
      routes: const [                
        CounterView(),                
        CounterRoute(),
        CharacterView(),                   
      ],          
      transitionBuilder: (context,child,animation)=> FadeTransition(                
              opacity: animation,                
              // the passed child is technically our animated selected-tab page                
              child: child,                
            ),       
      builder: (context, child) {                
        // obtain the scoped TabsRouter controller using context                
        final tabsRouter = AutoTabsRouter.of(context);                
        // Here we're building our Scaffold inside of AutoTabsRouter                
        // to access the tabsRouter controller provided in this context                
        //                 
        //alterntivly you could use a global key                
        return Scaffold(                
            body: child,               
            bottomNavigationBar: BottomNavigationBar(                
              currentIndex: tabsRouter.activeIndex,                
              onTap: (index) {                
                // here we switch between tabs                
                tabsRouter.setActiveIndex(index);                
              },                
              items: const [                
                BottomNavigationBarItem(label: 'bloC', icon: Icon(Icons.circle)),                
                BottomNavigationBarItem(label: 'Redux', icon: Icon(Icons.star)),
                BottomNavigationBarItem(label: 'Characters', icon: Icon(Icons.square)),                    
              ],                
            ));                
      },                
    );                
  }                
}
