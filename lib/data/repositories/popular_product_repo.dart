import 'package:e_milkapp/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:e_milkapp/utilities/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_URI);
  }
}
