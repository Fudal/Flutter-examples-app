import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/extensions/context_extension.dart';
import 'package:get_weather/generated/locale_keys.g.dart';
import 'package:get_weather/injections/bloc_factory.dart';
import 'package:get_weather/presentation/home/home_cubit.dart';
import 'package:get_weather/presentation/home/widgets/list_loading.dart';
import 'package:get_weather/routing/router.gr.dart';
import 'package:get_weather/style/colors.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/widgets/custom_error_dialog.dart';

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
  List<CityItem> _cities = [];
  bool _onlyFavorites = false;

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).loadCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(LocaleKeys.home_page_title.tr()),
          centerTitle: true,
          actions: [_filterButton(context)],
        ),
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (_, state) {
              if (state is HomeError) {
                CustomErrorDialog(
                  onClick: () => AutoRouter.of(context).pop(),
                  error: state.error,
                ).show(context);
              }
              if (state is HomeLoaded) {
                setState(() => _cities = state.items);
              }
            },
            builder: (context, state) {
              if (state is HomeLoading) {
                return Column(
                  children: const [
                    Spacer(),
                    Center(child: CircularProgressIndicator.adaptive()),
                    Spacer(),
                  ],
                );
              } else if (state is HomeLoaded) {
                return HomeListLoading(
                  !_onlyFavorites
                      ? _cities
                      : _cities.where((element) => element.isFavorite ?? true).toList(),
                  callback: (list) {
                    setState(() => _cities = list);
                    BlocProvider.of<HomeCubit>(context).saveCities(_cities);
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final item = await context.router.push(CityFormRoute());
          if (item != null && item is CityItem && !_cities.any((element) => element.cityName == item.cityName)) {
            _cities.add(item);
            if (mounted) {
              BlocProvider.of<HomeCubit>(context).saveCities(_cities);
            }
          }
        },
        backgroundColor: AppColors.primary_100,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _filterButton(BuildContext context) {
    return IconButton(
      onPressed: (){
        showModalBottomSheet(
          context: context,
          builder: (_) => Material(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: Dimens.spacingL),
              color: AppColors.background_100,
              child: Row(
                children: [
                  Checkbox(value: _onlyFavorites, onChanged: (val) {
                    setState(() {
                      _onlyFavorites = val ?? false;
                    });
                    Navigator.of(context).pop();
                  },),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _onlyFavorites = !_onlyFavorites;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      LocaleKeys.home_page_show_only_favorites.tr(),
                      style: context.typo.body1,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      icon: const Icon(Icons.filter_list_alt),
    );
  }
}
