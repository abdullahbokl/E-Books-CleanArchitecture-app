import 'package:flutter/material.dart';

class CustomPaginatedList extends StatelessWidget {
  const CustomPaginatedList({
    Key? key,
    required this.items,
    required this.onLoadMore,
    required this.itemBuilder,
    required this.isLoading,
    required this.hasReachedMax,
    required this.scrollController,
  }) : super(key: key);

  final List items;
  final Function onLoadMore;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool isLoading;
  final bool hasReachedMax;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final bool showLoading = isLoading && !hasReachedMax;
    return ListView.separated(
      controller: scrollController
        ..addListener(() {
          if (_doLoadMore()) {
            onLoadMore();
          }
        }),
      itemCount: items.length + (showLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return itemBuilder(context, index);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15.0);
      },
    );
  }

  bool _doLoadMore() {
    return (scrollController.offset >=
            scrollController.position.maxScrollExtent - 100) &&
        !isLoading &&
        !hasReachedMax;
  }
}
