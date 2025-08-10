import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';
final getIt = GetIt.instance;

void getItService() {
  // Registre suas dependências aqui, ex:
  getIt.registerSingleton<HomeViewModel>(HomeViewModel());
}
