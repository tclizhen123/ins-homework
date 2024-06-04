import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ins_hw/home/components/home_item.dart';
import 'package:ins_hw/home/vm/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = HomeViewModel();
  @override
  void initState() {
    _afterValidWidth().then((width) {
      _viewModel.getData(width?.floor()).then((retval) {
        retval.fold(
            (_) => {
                  //do sth in page
                }, (_) {
          //handle error page/alert
        });
      });
    });

    super.initState();
  }

  Future<double?> _afterValidWidth() async {
    Completer<double?> retval = Completer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      retval.complete(MediaQuery.of(context).size.width);
    });
    return retval.future;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => _viewModel,
      builder: (_, __) {
        return Container(
          color: Colors.black,
          child: const HomePageList(),
        );
      },
    );
  }
}

class HomePageList extends StatelessWidget {
  const HomePageList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel vm = context.watch<HomeViewModel>();
    if (!vm.data.isNotEmpty) {
      return Container();
    }
    return ListView.builder(
        itemCount: vm.data.length,
        itemBuilder: (cxt, i) {
          vm.checkAndLoadMore(i);
          return HomeItem(
            vm: vm.data[i],
          );
        });
  }
}
