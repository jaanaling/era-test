import 'package:era_test/features/notifications/presentation/widgets/latest_loader/components/latest_loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LatestListLoader extends StatelessWidget {
  const LatestListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LatestLoader(),
        Gap(20),
        LatestLoader(),
        Gap(20),
        LatestLoader(),
      ],
    );
  }
}
