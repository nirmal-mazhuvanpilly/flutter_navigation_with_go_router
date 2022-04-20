import 'package:flutter/material.dart';
import 'package:flutter_go_router_navigation/error_page.dart';
import 'package:flutter_go_router_navigation/page1.dart';
import 'package:flutter_go_router_navigation/page2.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter router = GoRouter(
    // urlPathStrategy: UrlPathStrategy.path,
    errorBuilder: (context, state) {
      debugPrint(state.error.toString());
      return ErrorPage();
    },
    routes: <GoRoute>[
      GoRoute(
          name: "HomePage",
          path: "/",
          builder: (BuildContext context, GoRouterState state) {
            return const Page1();
          }),
      GoRoute(
        path: "/page2",
        pageBuilder: (context, state) => MaterialPage<void>(
          name: "page2",
          key: state.pageKey,
          child: const Page2(),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Go Router',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
