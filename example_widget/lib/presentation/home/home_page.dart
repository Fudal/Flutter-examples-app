import 'package:fh_home_coding/domain/area_service.dart';
import 'package:fh_home_coding/domain/models/area_item.dart';
import 'package:fh_home_coding/presentation/home/widgets/home_content.dart';
import 'package:fh_home_coding/style/colors.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AreaService _areaService = AreaService();
  AreaItem? _area;

  @override
  void initState() {
    _area = _areaService.getArea();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_100,
        body: Center(
          child: Card(
            elevation: 1.1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.spacingS),
            ),
            child: HomeContent(area: _area),
          ),
        ),
      ),
    );
  }
}
