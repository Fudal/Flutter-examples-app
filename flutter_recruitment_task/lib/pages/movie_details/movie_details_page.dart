import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/injections/bloc_factory.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:flutter_recruitment_task/pages/movie_details/movie_details_cubit.dart';
import 'package:flutter_recruitment_task/pages/movie_details/widgets/page_content.dart';
import 'package:flutter_recruitment_task/widgets/custom_error_dialog.dart';

class MovieDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<MovieDetailsCubit>(
      create: (context) => blocFactory.get<MovieDetailsCubit>(),
      child: this,
    );
  }
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {

  @override
  void initState() {
    BlocProvider.of<MovieDetailsCubit>(context)
        .loadMovieDetail(widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (_, state) {
          if (state is MovieDetailsError) {
            CustomErrorDialog(
              onClick: () => AutoRouter.of(context).pop(),
              error: state.error,
            ).show(context);
          }
        },
        builder: (_, state) {
          if (state is MovieDetailsLoaded) {
            return MovieDetailsPageContent(state.movie);
          } else {
            return Column(
              children: const [
                Spacer(),
                Center(child: CircularProgressIndicator.adaptive()),
                Spacer(),
              ],
            );
          }
        },
      ),
    );
  }
}
