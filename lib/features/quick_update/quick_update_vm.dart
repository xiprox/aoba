import 'package:aoba/data/model/resource.dart';
import 'package:aoba/features/quick_update/data/quick_update.graphql.dart';
import 'package:aoba/services/services.dart';
import 'package:veee/veee.dart';

import 'data/quick_update_repo.dart';

class QuickUpdateViewModel extends ViewModel {
  final _repo = get<QuickUpdateRepo>();

  Resource<Query$FetchQuickUpdate> entries = Resource.loading();

  @override
  void onCreate() {
    super.onCreate();
    _loadInitial();
  }

  void _loadInitial() async {
    entries = await _repo.getEntries(userId: 79186);
    notifyListeners();
  }
}
