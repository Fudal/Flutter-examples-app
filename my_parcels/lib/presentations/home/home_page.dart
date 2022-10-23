import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_parcels/generated/locale_keys.g.dart';
import 'package:my_parcels/injections/bloc_factory.dart';
import 'package:my_parcels/presentations/home/home_cubit.dart';
import 'package:my_parcels/presentations/home/widgets/list_loading.dart';
import 'package:my_parcels/style/colors.dart';
import 'package:my_parcels/style/typography.dart';
import 'package:my_parcels/widgets/custom_error_dialog.dart';

class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<HomeCubit>(
      create: (context) => blocFactory.get<HomeCubit>(),
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;
  bool _isScrolling = false;

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).loadParcels();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          LocaleKeys.home_page_title.tr(),
          style: AppTypography.of(context).body1.dark_100(),
        ),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
          listener: (_, state) {
            if (state is HomeError) {
              CustomErrorDialog(
                onClick: () => AutoRouter.of(context).pop(),
                error: state.error,
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              _isScrolling = false;
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is HomeIdle) {
              _isScrolling = false;
              return HomeListLoading(
                items: state.parcels,
                scrollController: _scrollController,
              );
            } else if (state is HomeLoadingMore) {
              return HomeListLoading(
                items: state.parcels,
                scrollController: _scrollController,
                isLoadingMore: true,
              );
            } else {
              _isScrolling = false;
              return const SizedBox.shrink();
            }
          },
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold && !_isScrolling) {
      _isScrolling = true;
      BlocProvider.of<HomeCubit>(context).loadMore();
    }
  }
}
