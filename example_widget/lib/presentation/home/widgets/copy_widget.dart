import 'package:fh_home_coding/style/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyWidget extends StatelessWidget {
  final String? contentToCopy;

  const CopyWidget({super.key, this.contentToCopy});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (contentToCopy != null) {
          Clipboard.setData(ClipboardData(text: contentToCopy));
        }
      },
      child: Image.asset(AppImages.copy),
    );
  }
}
