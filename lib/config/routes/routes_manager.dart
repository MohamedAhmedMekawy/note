import 'package:flutter/material.dart';
import 'package:notes_app/views/home/home_view.dart';

class Routes {
  static var routes = <String, WidgetBuilder>{
    // ChatLoginView.routeName: (ctx) => ChangeNotifierProvider(
    //     create: (context) => ChatSignInViewModel(),
    //     child: const ChatLoginView()),
    NotesAppView.routeName: (ctx) => const NotesAppView(),
  };

  static Route<BuildContext>? getRoutes(RouteSettings settings) {
    var builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: builder,
      );
    }
    return null;
  }
}
