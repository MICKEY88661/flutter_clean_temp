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
      body: const HomeBody(),
    );
  }
}

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsCtrlProvider).news;

    return news.when(
      data: (news) {
        if (news.isEmpty) {
          return const Center(
            child: Text("no news"),
          );
        }
        return ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            final n = news[index];

            return Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title : ${n.title}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Author : ${n.author}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "Description : ${n.description}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (e, __) {
        return Text('$e');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
