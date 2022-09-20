part of 'home_page.dart';

class NewsBody extends ConsumerStatefulWidget {
  const NewsBody({Key? key}) : super(key: key);

  @override
  ConsumerState<NewsBody> createState() => _NewsBodyState();
}

class _NewsBodyState extends ConsumerState<NewsBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
