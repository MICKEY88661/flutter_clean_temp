part of 'home_page.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: DropdownButton<Locale>(
              value: ref.watch(settingCtrlProvider).locale,
              items: const [
                DropdownMenuItem(
                  value: Locale("en"),
                  child: Text("en"),
                ),
                DropdownMenuItem(
                  value: Locale("zh"),
                  child: Text("zh"),
                )
              ],
              onChanged: (l) {
                if (l == null) return;
                ref.read(settingCtrlProvider.notifier).setLocale(l);
              },
            ),
          ),
          const ListTile(
            leading: Icon(Icons.palette),
            title: Center(),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
