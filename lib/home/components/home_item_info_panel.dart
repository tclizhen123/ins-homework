import 'package:flutter/material.dart';
import 'package:ins_hw/home/vm/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeItemInfoPanel extends StatelessWidget {
  final int? pictureCount;
  final int? pictureIndex;
  const HomeItemInfoPanel({
    super.key,
    this.pictureCount,
    this.pictureIndex,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _HomeItemInfoActionBar(),
        _HomeItemInfoTextContent(),
      ],
    );
  }
}

class _HomeItemInfoActionBar extends StatelessWidget {
  const _HomeItemInfoActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double kIconSize = 16;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
              color: Colors.black,
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.favorite,
                      size: kIconSize,
                      color: Colors.red,
                    ),
                    onTap: () {
                      HomeViewModel? vm = Provider.of<HomeViewModel>(context);
                      vm.like();
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: kIconSize,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: kIconSize,
                  ),
                ],
              )),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: Colors.brown,
          ),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            child: const Icon(
              Icons.book,
              color: Colors.white,
              size: kIconSize,
            ),
          ),
        ))
      ],
    );
  }
}

class _HomeItemInfoTextContent extends StatelessWidget {
  const _HomeItemInfoTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    HomeItemViewModel vm = Provider.of<HomeItemViewModel>(context);
    String? likeStr = vm?.like;
    String? contentStr = vm?.content;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (likeStr?.isNotEmpty ?? false)
            Container(
              child: Text(
                likeStr ?? "",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          if (contentStr?.isNotEmpty ?? false)
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                contentStr ?? "",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
