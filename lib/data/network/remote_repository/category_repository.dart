import 'package:grocery_app/data/network/api_client.dart';
import 'package:grocery_app/utils/rest_api_urls.dart';
import 'package:grocery_app/backbone/dependency_injection.dart' as di;
abstract class CategoryRepository {
  Future<void> getList();
}

class CategoryRepositoryImpl implements CategoryRepository{
  @override
  Future<void> getList() async {
    final ApiClient apiClient = di.sl.get();
    await apiClient.get(getCategoriesUrl);
  }

}