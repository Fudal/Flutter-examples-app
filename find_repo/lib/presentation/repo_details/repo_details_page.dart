import 'package:auto_route/auto_route.dart';
import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/injections/bloc_factory.dart';
import 'package:find_repo/presentation/repo_details/repo_details_cubit.dart';
import 'package:find_repo/presentation/repo_details/widgets/page_content.dart';
import 'package:find_repo/widgets/custom_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepoDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final RepoItem repo;

  const RepoDetailsPage({super.key, required this.repo});

  @override
  Widget wrappedRoute(BuildContext context) {
    final BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<RepoDetailsCubit>(
      create: (context) => blocFactory.get<RepoDetailsCubit>(),
      child: this,
    );
  }

  @override
  _RepoDetailsPageState createState() => _RepoDetailsPageState();
}

class _RepoDetailsPageState extends State<RepoDetailsPage> {

  @override
  void initState() {
    BlocProvider.of<RepoDetailsCubit>(context).loadIssues(widget.repo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.repo.name ?? ""),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>context.router.pop(),
        ),
      ),
      body: BlocConsumer<RepoDetailsCubit, RepoDetailsState>(
        listener: (_, state) {
          if (state is RepoDetailsError) {
            CustomErrorDialog(
              onClick: () => AutoRouter.of(context).pop(),
              error: state.error,
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is RepoDetailsLoading) {
            return Column(
              children: const [
                Spacer(),
                Center(child: CircularProgressIndicator.adaptive()),
                Spacer(),
              ],
            );
          } else if (state is RepoDetailsIdle) {
            return RepoDetailsPageContent(
              repo: widget.repo,
              issues: state.issues,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
