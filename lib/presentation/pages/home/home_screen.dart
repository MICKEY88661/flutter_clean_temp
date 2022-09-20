part of 'home_page.dart';

/// 首頁畫面
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void dispose() {
    ref.read(homeCtrlProvider.notifier).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.appName),
      ),
      drawer: const HomeDrawer(),
      body: PageView(
        controller: ref.watch(homeCtrlProvider.notifier).homeBodyController,
        children: const [
          NewsBody(),
          Posts(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(homeCtrlProvider),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.podcasts), label: "Posts"),
        ],
        onTap: (index) {
          ref.read(homeCtrlProvider.notifier).navigationItemTapped(index);
        },
      ),
    );
  }
}

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('post'),
    );
  }
}
