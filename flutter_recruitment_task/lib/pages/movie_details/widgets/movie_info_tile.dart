import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/style/dimens.dart';

class MovieInfoTile extends StatelessWidget {
  final String title;
  final String content;

  const MovieInfoTile({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacingM),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 8.0),
          Text(
            content,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
