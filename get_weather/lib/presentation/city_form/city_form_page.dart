import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/generated/locale_keys.g.dart';
import 'package:get_weather/injections/bloc_factory.dart';
import 'package:get_weather/presentation/city_form/city_form_cubit.dart';
import 'package:get_weather/style/colors.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/widgets/custom_error_dialog.dart';
import 'package:get_weather/widgets/custom_input.dart';
import 'package:get_weather/widgets/outline_rounded_button.dart';

class CityFormPage extends StatefulWidget implements AutoRouteWrapper {
  final CityItem? item;

  const CityFormPage({super.key, this.item});

  @override
  _CityFormPageState createState() => _CityFormPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<CityFormCubit>(
      create: (context) => blocFactory.get<CityFormCubit>(),
      child: this,
    );
  }
}

class _CityFormPageState extends State<CityFormPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isFavorite = false;
  CityItem? _city;

  @override
  void initState() {
    if (widget.item != null) {
      _city = widget.item;
      _controller.text = _city?.cityName ?? "";
      _isFavorite = _city?.isFavorite ?? false;
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.item != null
                ? LocaleKeys.city_form_page_edit.tr()
                : LocaleKeys.city_form_page_add.tr(),
            ),
            centerTitle: true,
          ),
          body: Material(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.spacingL),
              child: SafeArea(
                child: BlocConsumer<CityFormCubit, CityFormState>(
                  listener: (_, state) {
                    if (state is CityFormError) {
                      CustomErrorDialog(
                        onClick: () => AutoRouter.of(context).pop(),
                        error: state.error,
                      ).show(context);
                    }
                    if (state is CityFormLoaded) {
                      context.router.pop(state.city.copyWith(isFavorite: _isFavorite));
                    }
                  },
                  builder: (context, state) {
                    if (state is CityFormLoading) {
                      return Column(
                        children: const [
                          Spacer(),
                          Center(child: CircularProgressIndicator.adaptive()),
                          Spacer(),
                        ],
                      );
                    } else if (state is CityFormInitial) {
                      return Column(
                        children: [
                          CustomInput(
                            controller: _controller,
                            onSubmitted: () {
                              if (_controller.text.isNotEmpty) {
                                BlocProvider.of<CityFormCubit>(context)
                                    .addCity(_controller.text);
                              }
                            },
                          ),
                          Row(
                            children: [
                              TextButton(
                                child: Text(LocaleKeys.city_form_page_favorite.tr()),
                                onPressed: () => setState(() => _isFavorite = !_isFavorite),
                              ),
                              Checkbox(
                                value: _isFavorite,
                                onChanged: (val) => setState(() => _isFavorite = val ?? false),
                              )
                            ],
                          ),
                          OutlineRoundedButton(
                            text: LocaleKeys.city_form_page_save.tr(),
                            onPressed: () {
                              if (_controller.text.isNotEmpty) {
                                BlocProvider.of<CityFormCubit>(context)
                                    .addCity(_controller.text);
                              }
                            },
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
    );
  }
}
