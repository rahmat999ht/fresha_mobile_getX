import '../core.dart';

class ButtonNavBar extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String label;
  final void Function() onTap;
  const ButtonNavBar({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.inverseSurface;
    final colorActive = context.colorScheme.primary;
    final style = context.textTheme.labelLarge!
        .copyWith(color: selectedIndex == index ? colorActive : color);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: context.deviceSize.width * 0.15,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(8),
            Icon(
              icon,
              color: selectedIndex == index ? colorActive : color,
            ),
            Text(
              label,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
