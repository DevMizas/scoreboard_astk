import 'package:mobx/mobx.dart';
import 'package:placar_astk/presentation/presentation.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  HomePageEnum _homePageEnum = HomePageEnum.kumite;

  @computed
  HomePageEnum get homePageEnum => _homePageEnum;

  @action
  void setPageEnum(HomePageEnum page) {
    _homePageEnum = page;
  }
  
}
