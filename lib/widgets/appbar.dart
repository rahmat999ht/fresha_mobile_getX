import '../core.dart';

AppBar appBarTitle({
  required String title,
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: true,
    elevation: 5,
    automaticallyImplyLeading: false,
    backgroundColor: context.colorScheme.background,
    title: Text(
      title,
      style: context.textTheme.titleLarge,
    ),
  );
}
