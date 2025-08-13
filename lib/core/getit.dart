import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';
import 'package:placar_astk/resources/resources.dart';

final getIt = GetIt.instance;

void getItService() {
  getIt.registerSingleton<HomeViewModel>(HomeViewModel());
  getIt.registerSingleton<InfractionsViewModel>(InfractionsViewModel(), instanceName: "blueC1");
  getIt.registerSingleton<InfractionsViewModel>(InfractionsViewModel(), instanceName: "blueC2");

  getIt.registerSingleton<InfractionsViewModel>(InfractionsViewModel(), instanceName: "redC1");
  getIt.registerSingleton<InfractionsViewModel>(InfractionsViewModel(), instanceName: "redC2");
  getIt.registerSingleton<MenuViewModel>(MenuViewModel());
  getIt.registerSingleton<KumiteViewModel>(KumiteViewModel());
}
