import 'package:easy_localization/easy_localization.dart';
import 'package:find_repo/domain/base/errors/connection_exception.dart';
import 'package:find_repo/domain/base/errors/server_exception.dart';
import 'package:find_repo/generated/locale_keys.g.dart';
import 'package:find_repo/style/dimens.dart';
import 'package:find_repo/style/typography.dart';
import 'package:find_repo/widgets/outline_rounded_button.dart';
import 'package:flutter/material.dart';

class CustomErrorDialog extends StatelessWidget {
  final String? buttonLabel;
  final String? message;
  final bool isError;
  final Function()? onClick;
  final dynamic error;

  const CustomErrorDialog({
    this.buttonLabel,
    this.message,
    this.onClick,
    this.error,
    this.isError = true,
    super.key,});

  Future<dynamic> show(BuildContext context) => showDialog(
    barrierColor: Colors.black.withOpacity(0.4),
    context: context,
    builder: (context) => this,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacingL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isError
                  ? LocaleKeys.common_error_occurs.tr()
                  : LocaleKeys.common_info.tr(),
              style: AppTypography.of(context).body1,
            ),
            const SizedBox(height: Dimens.spacingS),
            Text(
              error is ConnectionException
                  ? LocaleKeys.common_network_error.tr()
                  : error is ServerException
                  ? LocaleKeys.common_server_error.tr()
                  : message != null
                  ? message!
                  : LocaleKeys.common_generic_error_message.tr(),
              style: AppTypography.of(context).body2,
            ),
            const SizedBox(height: Dimens.spacingS),
            OutlineRoundedButton(
              text: LocaleKeys.common_close.tr(),
              onPressed: onClick?.call,
            )
          ],
        ),
      ),
    );
  }
}
