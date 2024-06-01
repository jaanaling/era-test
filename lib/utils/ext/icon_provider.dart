const String iconsFolderPath = 'assets/icons/svg/';

enum IconProvider {
  backArrow(iconName: 'back_arrow.svg'),
  unknown(iconName: '');

  const IconProvider({
    required this.iconName,
  });

  final String iconName;

  String buildIconUrl() {
    return '$iconsFolderPath$iconName';
  }
}
