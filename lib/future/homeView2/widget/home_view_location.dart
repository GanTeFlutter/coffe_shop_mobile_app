part of '../home_page.dart';

class HomeViewLocation extends StatefulWidget {
  const HomeViewLocation({
    required this.onPressed,
    required this.location, super.key,
  });
  final  String location;
  final VoidCallback onPressed;

  @override
  State<HomeViewLocation> createState() => _HomeViewLocationState();
}

class _HomeViewLocationState extends State<HomeViewLocation> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: widget.onPressed,
      label: Text(
        widget.location,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
      ),
      icon: const Icon(
        Icons.location_on_rounded,
        color: ApplicationColors.kahve,
      ),
    );
  }
}
