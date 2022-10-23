import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final void Function()? onchange;

  const SearchBox({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.onchange,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          border: Border(
            bottom: BorderSide(color: Colors.black.withOpacity(0.1)),
          ),
        ),
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Search...',
          ),
          onSubmitted: onSubmitted,
          onChanged: (_) => onchange?.call(),
        ),
      );
}
