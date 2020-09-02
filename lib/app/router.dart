import 'package:auto_route/auto_route_annotations.dart';
import 'package:say_oldbirds_flutter/ui/views/home/home_view.dart';
import 'package:say_oldbirds_flutter/ui/views/setup/startup_view.dart';

// flutter pub run build_runner build 生成路由
@MaterialAutoRouter(routes: [
  MaterialRoute(page: StartupView, initial: true),
  MaterialRoute(page: HomeView),
])
class $Router {}
