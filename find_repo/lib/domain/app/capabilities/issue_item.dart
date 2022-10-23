import 'package:find_repo/domain/app/capabilities/user_item.dart';

class IssueItem {
  final int? id;
  final int? commentsCount;
  final String? title;
  final String? body;
  final UserItem? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  IssueItem({
    this.id,
    this.title,
    this.user,
    this.commentsCount,
    this.createdAt,
    this.updatedAt,
    this.body,
  });
}
