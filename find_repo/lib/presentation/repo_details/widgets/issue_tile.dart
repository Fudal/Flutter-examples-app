import 'package:easy_localization/easy_localization.dart';
import 'package:find_repo/domain/app/capabilities/issue_item.dart';
import 'package:find_repo/extenstions/context_extension.dart';
import 'package:find_repo/style/colors.dart';
import 'package:find_repo/style/dimens.dart';
import 'package:flutter/material.dart';

class IssueTile extends StatelessWidget {
  final IssueItem issue;

  const IssueTile(this.issue, {super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatterDay = DateFormat(
      "yyyy-MM-dd",
      Localizations.localeOf(context).languageCode,
    );

    return Card(
      color: AppColors.secondary_100.withOpacity(0.5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.spacingXs),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacingS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (issue.user?.avatarUrl?.isNotEmpty == true) ...[
                  ClipOval(
                    child: Image.network(
                      issue.user!.avatarUrl!,
                      width: Dimens.spacingM,
                      height: Dimens.spacingM,
                    ),
                  ),
                  const SizedBox(width: Dimens.spacingM),
                ],
                Expanded(
                  child: Text(
                    issue.title ?? "",
                  ),
                )
              ],
            ),
            const SizedBox(height: Dimens.spacingS),
            if (issue.createdAt != null)
              Text(
                  formatterDay.format(issue.createdAt!),
              ),
            const SizedBox(height: Dimens.spacingS),
            Text(
              issue.body ?? "",
              style: context.typo.body1,
            ),
          ],
        ),
      ),
    );
  }
}
