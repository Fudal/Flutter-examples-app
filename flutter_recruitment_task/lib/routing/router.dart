import 'package:auto_route/auto_route.dart';
import 'package:flutter_recruitment_task/pages/movie_details/movie_details_page.dart';
import 'package:flutter_recruitment_task/pages/movie_list/movie_list_page.dart';
import 'package:flutter_recruitment_task/pages/two_buttons/two_buttons_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<dynamic>(page: MovieListPage, initial: true),
    AutoRoute<dynamic>(page: MovieDetailsPage),
    AutoRoute<dynamic>(page: TwoButtonsPage),
  ],
)
class $AppRouter {}
