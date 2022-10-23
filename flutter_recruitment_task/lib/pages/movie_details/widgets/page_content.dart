import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/generated/locale_keys.g.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:flutter_recruitment_task/pages/movie_details/widgets/content_separator.dart';
import 'package:flutter_recruitment_task/pages/movie_details/widgets/movie_info_tile.dart';

class MovieDetailsPageContent extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPageContent(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'en_US');

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MovieInfoTile(
            title: LocaleKeys.movie_details_page_budget.tr(),
            content: formatter.format(movie.budget),
          ),
          const MovieDetailsContentSeparator(),
          MovieInfoTile(
            title: LocaleKeys.movie_details_page_revenue.tr(),
            content: formatter.format(movie.revenue),
          ),
          const MovieDetailsContentSeparator(),
          MovieInfoTile(
            title: LocaleKeys.movie_details_page_should_i_watch.tr(),
            content: _checkWatchMovie(),
          ),
        ],
      ),
    );
  }

  String _checkWatchMovie() {
    const sunday = 6;
    final day = DateTime.now().weekday;

    if (day == sunday && movie.profit != null && movie.profit! > 1000000) {
      return LocaleKeys.common_yes.tr();
    } else {
      return LocaleKeys.common_no.tr();
    }
  }
}
