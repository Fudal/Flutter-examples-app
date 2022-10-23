import 'package:auto_route/auto_route.dart';
import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/extenstions/context_extension.dart';
import 'package:find_repo/routing/router.gr.dart';
import 'package:find_repo/style/dimens.dart';
import 'package:find_repo/style/typography.dart';
import 'package:flutter/material.dart';

class RepoTile extends StatelessWidget {
  final RepoItem repo;
  final bool isDetailsView;

  const RepoTile(this.repo, {super.key, this.isDetailsView = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.spacingS),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(Dimens.spacingS),
      child: Material(
        child: InkWell(
          onTap: !isDetailsView
              ? () => context.router.push(RepoDetailsRoute(repo: repo))
              : null,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.spacingS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (repo.owner?.avatarUrl?.isNotEmpty == true) ...[
                      ClipOval(
                        child: Image.network(repo.owner!.avatarUrl!, width: Dimens.spacingM, height: Dimens.spacingM,),
                      ),
                      const SizedBox(width: Dimens.spacingM),
                    ],
                    Expanded(
                      child: Text(
                        repo.name ?? "",
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Dimens.spacingS),
                Text(
                  repo.name ?? "",
                  style: context.typo.body1,
                ),
                Text(
                  repo.description ?? "",
                  style: context.typo.body2,
                ),
                Text(
                  repo.language ?? "",
                  style: context.typo.body2.dark_50(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
