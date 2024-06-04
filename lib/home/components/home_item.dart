import 'package:flutter/material.dart';
import 'package:ins_hw/home/components/home_item_avatar.dart';
import 'package:ins_hw/home/components/home_item_info_panel.dart';
import 'package:ins_hw/home/components/home_picture_carousel.dart';
import 'package:ins_hw/home/vm/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeItem extends StatefulWidget {
  final HomeItemViewModel? vm;
  const HomeItem({super.key, required this.vm});

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  int pictureCarouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => widget.vm,
      builder: (_, __) {
        return Column(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 16, top: 28, bottom: 8),
                child: const HomeItemAvatar()),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: HomePictureCarousel(
                urls: widget.vm?.imageList ?? [],
                callback: (index) {
                  setState(() {
                    pictureCarouselIndex = index;
                  });
                },
              ),
            ),
            const HomeItemInfoPanel()
          ],
        );
      },
    );
  }
}
