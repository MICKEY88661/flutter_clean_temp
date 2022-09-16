part of 'home_page.dart';

/// 首頁畫面
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.appName),
      ),
      drawer: const HomeDrawer(),
      body: const HomeBody(),
    );
  }
}

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(ref.watch(settingCtrlProvider).locale.toString()),
          Center(
            child: DropdownButton<Locale>(
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
        ],
      ),
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
                      "${context.locale.title} : ${n.title}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${context.locale.author} : ${n.author}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      "${context.locale.publishedDate} : ${n.published}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${context.locale.description} : ${n.description}",
                      style: Theme.of(context).textTheme.bodyLarge,
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
