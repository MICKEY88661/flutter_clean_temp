part of 'home_page.dart';

/// 首頁畫面
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: const Center(
        child: Text("this is home body"),
      ),
    );
  }
}
