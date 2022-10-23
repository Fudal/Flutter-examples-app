import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_parcels/domain/app/capabilities/parcel/parcel_item.dart';
import 'package:my_parcels/presentations/home/home_cubit.dart';
import 'package:my_parcels/routing/router.gr.dart';
import 'package:my_parcels/style/dimens.dart';

class HomeListLoading extends StatelessWidget {
  final ScrollController scrollController;
  final List<ParcelItem> items;
  final bool isLoadingMore;

  const HomeListLoading({
    super.key,
    required this.items,
    required this.scrollController,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => BlocProvider.of<HomeCubit>(context).loadParcels(),
      child: ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(vertical: Dimens.spacingM),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const SizedBox(
              width: Dimens.spacingM,
              height: Dimens.spacingM,
              child: CircularProgressIndicator(),
            );
          }
          return ListTile(
            onTap: () => context.router.push(ParcelDetailsRoute(parcel: items[index])),
            title: Text(items[index].service ?? ""),
            subtitle: Text(items[index].details?.packageNo ?? ""),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: isLoadingMore
            ? items.length + 1
            : items.length,
      ),
    );
  }
}
