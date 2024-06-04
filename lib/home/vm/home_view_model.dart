import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:ins_hw/home/model/home_model.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  int widthForImg = 350;
  int page = 0;
  final List<HomeModel> _models = [];
  List<HomeItemViewModel> data = [];
  int refreshTValue = 0;

  Future<Either> getData(int? width) {
    widthForImg = width ?? widthForImg;
    return getNextPage(page: 0);
  }

  Future<Either> getNextPage({int? page}) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      if ((page ?? 0) == 0) {
        _models.clear();
      }
      page = (page ?? 0);
      List<Map<String, dynamic>>? data = _genMockData();
      _models.addAll(data.map<HomeModel>((e) {
        return HomeModel.fromJson(e);
      }).toList());
      this.data = _models.map<HomeItemViewModel>((e) {
        return HomeItemViewModel(e);
      }).toList();
      refreshTValue = Random().nextInt(1000000);
      notifyListeners();
      return Left(data); //or Right('error message');
    });
  }

  checkAndLoadMore(int index) {
    if (index != 0 && index == (data.length - 1)) {
      getNextPage(page: (page + 1));
    }
  }

  List<Map<String, dynamic>> _genMockData() {
    List<String> genRandomImageUrlList() {
      return Iterable<int>.generate(Random().nextInt(10)).toList().map((i) {
        return "https://picsum.photos/id/${Random().nextInt(23)}/$widthForImg/800";
      }).toList();
    }

    List<Map<String, dynamic>> retval = [];
    for (int i = 0; i < 5; i++) {
      retval.add({
        "images": genRandomImageUrlList(),
        "likeAvatars": genRandomImageUrlList(),
        "likeCount": Random().nextInt(100),
        "content": """Here you can view all the images Lorem Picsum provides.
Get a specific image by adding /id/{image} to the start of the url.
https://picsum.photos/id/1/200/300
More detailed instructions can be found on the main page.
"""
      });
    }
    return retval;
  }

  like() {
    //todo
  }

  cancelLike() {
    //todo
  }
}

class HomeItemViewModel {
  final HomeModel? data;
  HomeItemViewModel(this.data);
  String get content => data?.content ?? "";
  List<String?> get imageList => data?.images ?? [];
  String get like =>
      (data?.likeCount ?? 0) == 0 ? "" : "${data?.likeCount} likes";
}
