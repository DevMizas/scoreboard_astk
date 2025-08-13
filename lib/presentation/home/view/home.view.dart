import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';

class HomeView extends StatelessWidget {
  final homeVM = GetIt.I.get<HomeViewModel>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Observer(
        builder: (context) {
          return homeVM.homePageEnum == HomePageEnum.kumite ? KumiteView() : Container();
        },
      ),
    );
  }
}
