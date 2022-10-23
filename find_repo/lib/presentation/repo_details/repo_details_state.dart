part of 'repo_details_cubit.dart';

abstract class RepoDetailsState extends Equatable {
  const RepoDetailsState();
}

class RepoDetailsLoading extends RepoDetailsState {
  @override
  List<Object> get props => [];
}

class RepoDetailsIdle extends RepoDetailsState {
  final List<IssueItem> issues;

  const RepoDetailsIdle(this.issues);

  @override
  List<Object> get props => [issues];
}

class RepoDetailsError extends RepoDetailsState {
  final dynamic error;

  const RepoDetailsError(this.error);

  @override
  List<Object> get props => [];
}
