import 'package:easy_localization/easy_localization.dart';
import 'package:find_repo/domain/app/capabilities/issue_item.dart';
import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/generated/locale_keys.g.dart';
import 'package:find_repo/presentation/repo_details/widgets/issue_tile.dart';
import 'package:find_repo/presentation/widgets/repo_tile.dart';
import 'package:find_repo/style/dimens.dart';
import 'package:flutter/material.dart';

class RepoDetailsPageContent extends StatelessWidget {
  final RepoItem repo;
  final List<IssueItem> issues;

  const RepoDetailsPageContent({super.key, required this.repo, required this.issues});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacingXs),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RepoTile(repo, isDetailsView: true),
            const SizedBox(height: Dimens.spacingM),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(LocaleKeys.repo_details_page_issues_amount.tr()),
                      Text(" ${repo.openIssuesCount.toString()}"),
                    ],
                  ),
                  for(var item in issues) IssueTile(item)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
