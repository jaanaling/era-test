import 'package:era_test/features/news/theme/theme.dart';
import 'package:era_test/features/notifications/presentation/widgets/features_loader/features_loader.dart';
import 'package:era_test/theme/theme.dart';
import 'package:era_test/utils/ext/icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

var _feature = StandartTheme().News;

class AppBarNews extends StatelessWidget {
  final String title;
  final String imageUrl;

  const AppBarNews({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      stretchTriggerOffset: 300.0,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.25),
                  colorBlendMode: BlendMode.darken,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const FeaturesLoader();
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: Text(
                    title,
                    style: _feature.text.titleTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 41),
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: SvgPicture.asset(
                        IconProvider.backArrow.buildIconUrl(),
                        colorFilter: ColorFilter.mode(
                          _feature.color.iconColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    onTap: () => context.canPop() ? context.pop() : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
