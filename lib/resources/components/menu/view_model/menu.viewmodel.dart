import 'package:mobx/mobx.dart';
part 'menu.viewmodel.g.dart';

class MenuViewModel = _MenuViewModelBase with _$MenuViewModel;

abstract class _MenuViewModelBase with Store {
  @observable
  bool activeDropdownMenu = false;

  @action
  void setActiveDropdownMenu() {
    activeDropdownMenu = !activeDropdownMenu;
  }
}
