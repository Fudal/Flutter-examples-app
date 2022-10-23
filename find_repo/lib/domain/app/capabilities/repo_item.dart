import 'package:find_repo/domain/app/capabilities/user_item.dart';

class RepoItem {
  final int? id;
  final String? name;
  final String? fullName;
  final String? description;
  final String? issuesUrl;
  final String? homepage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? openIssuesCount;
  final String? defaultBranch;
  final String? language;
  final UserItem? owner;

  RepoItem({
    this.id,
    this.name,
    this.fullName,
    this.description,
    this.issuesUrl,
    this.createdAt,
    this.updatedAt,
    this.homepage,
    this.openIssuesCount,
    this.defaultBranch,
    this.language,
    this.owner,
  });
}
