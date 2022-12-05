import 'package:get_it/get_it.dart';

extension GetItExts on GetIt {
  void reregisterSingleton<T extends Object>(T object) {
    if (GetIt.instance.isRegistered<T>()) {
      GetIt.instance.unregister<T>();
    }
    GetIt.I.registerSingleton<T>(object);
  }
}
