import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/injections/bloc_factory.dart';
import 'package:get_weather/presentation/city_details/city_details_cubit.dart';
import 'package:get_weather/presentation/city_details/widgets/page_content.dart';
import 'package:get_weather/widgets/custom_error_dialog.dart';

class CityDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final CityItem city;

  const CityDetailsPage(this.city, {super.key});

  @override
  _CityDetailsPageState createState() => _CityDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<CityDetailsCubit>(
      create: (context) => blocFactory.get<CityDetailsCubit>(),
      child: this,
    );
  }
}

class _CityDetailsPageState extends State<CityDetailsPage> {

  @override
  void initState() {
    BlocProvider.of<CityDetailsCubit>(context).loadDetails(widget.city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.city.cityName ?? ""),
            centerTitle: true,
          ),
          body: BlocConsumer<CityDetailsCubit, CityDetailsState>(
            listener: (_, state) {
              if (state is CityDetailsError) {
                CustomErrorDialog(
                  onClick: () => AutoRouter.of(context).pop(),
                  error: state.error,
                ).show(context);
              }
            },
            builder: (_, state) {
              if (state is CityDetailsLoaded) {
                return CityDetailsPageContent(state.cityDetails);
              } else {
                return Column(
                  children: const [
                    Spacer(),
                    Center(child: CircularProgressIndicator.adaptive()),
                    Spacer(),
                  ],
                );
              }
            },
          ),
        ),
    );
  }
}
