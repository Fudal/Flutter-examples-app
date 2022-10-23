import 'package:auto_route/auto_route.dart';
import 'package:find_repo/presentation/home/home_page.dart';
import 'package:find_repo/presentation/repo_details/repo_details_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<dynamic>(page: HomePage, initial: true),
    AutoRoute<dynamic>(page: RepoDetailsPage),
  ],
)
class $AppRouter {}
