import 'package:news/Local/Core/Constant/api_links.dart';
import '../../../../Global/Core/Class/crud.dart';

class NewsData {
  Crud crud;
  NewsData(this.crud);

  getNewsData({required String? query}) async {
    var response = await crud.getData(
        linkUrl: '${AppLinks.serverLink}?$query&apiKey=${AppLinks.apiKey}',
        isAuthurized: false);
    return response.fold((l) => l, (r) => r);
  }
}
