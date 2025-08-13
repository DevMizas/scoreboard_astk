import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/resources/resources.dart';

class MenuView extends StatelessWidget {
  final menuVM = GetIt.I.get<MenuViewModel>();
  MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                  height: menuVM.activeDropdownMenu == true ? 100 : 0,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  child: ListView(
                    physics: CarouselScrollPhysics(),
                    padding: EdgeInsets.only(left: 10),
                    children: [
                      TextButtonToMenu(onPressed: () {}, text: "Kata",),
                      TextButtonToMenu(onPressed: () {}, text: "Kumite",),
                      TextButtonToMenu(onPressed: () {}, text: "Reset",),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    menuVM.setActiveDropdownMenu();
                  },
                  child: Container(
                    height: 20,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue.shade400),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                    child: Icon(menuVM.activeDropdownMenu == false ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded, size: 20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
