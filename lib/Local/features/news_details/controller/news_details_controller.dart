import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:news/Global/Core/Class/HiveBox.dart';
import 'package:news/Global/Core/Class/app_tost.dart';
import 'package:news/Local/features/categories/model/news_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../../favorite/controller/favorite_controller.dart';

class NewsDetailsController extends GetxController {
  Article model = Get.arguments['NewsModel'];
  final FavoriteController controller = Get.find();
  Box<Article> favorieBox = Hive.box(HiveBox.favoriteBox);
  List<Article> favoriteArtilce = [];
  saveImageToGalery(String image) async {
    try {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        var response = await Dio()
            .get(image, options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data),
            quality: 68,
            name: 'Image1');
        print(result);
        AppToasts.successToast('Image Add To Galery');
      }
    } catch (e) {
      AppToasts.errorToast('Fail To Add Image');
      print(e);
    }
  }

  shareNewsImage(String? subject, String title) async {
    await Share.share(title, subject: subject);
  }

  changeFave() {
    model.isLiked = !model.isLiked!;
    int index = favoriteArtilce
        .indexWhere((element) => element.content!.contains(model.content!));
    if (index == -1) {
      favorieBox.add(model);
    } else {
      favorieBox.putAt(index, model);
    }
    print('length ${favorieBox.length}');
    update();
  }

  @override
  void onInit() {
    for (var i = 0; i < favorieBox.length; i++) {
      favoriteArtilce.add(favorieBox.getAt(i)!);
    }
    super.onInit();
  }
}
