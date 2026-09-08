import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: 19,
      color: AppColors.primary,
    );
  }
}
