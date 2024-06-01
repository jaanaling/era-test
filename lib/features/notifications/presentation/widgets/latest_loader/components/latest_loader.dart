import 'package:era_test/features/notifications/theme/theme.dart';
import 'package:era_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

var _feature = StandartTheme().Notifications;

class LatestLoader extends StatelessWidget {
  const LatestLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 500),
      baseColor: _feature.color.loaderBackgroungColor,
      highlightColor: _feature.color.loaderShimmerColor,
      child: Container(
        height: 103,
        decoration: BoxDecoration(
          color: _feature.color.loaderBackgroungColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(9.0),
          ),
        ),
      ),
    );
  }
}
