import 'dart:io';

import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ZoomInZoomOutImage extends StatelessWidget {
  final String image;
  const ZoomInZoomOutImage({super.key, required this.image});

  // saveImage() async {
  //   final encodedStr = image;

  //   Uint8List bytes = base64.decode(encodedStr);
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   String fullPath = '$dir/abc.png';
  //   print("local file full path ${fullPath}");
  //   File file = File(fullPath);
  //   await file.writeAsBytes(bytes);
  //   print(file.path);

  //   final result = await ImageGallerySaver.saveImage(bytes);
  //   DialogHelper.showFlutterToast(strMsg: " Saved Successfully");
  //   print(result);

  //   return file.path;
  //

  Future<void> saveImage(BuildContext context, String url) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    print("ikgfhjkfghkjlfgklh   " + url);

    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/image.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }
    } catch (e) {
      message = 'An error occurred while saving the image';
    }

    if (message != null) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppHelper.themelight
            ? AppColors.primarycolorYellow
            : AppColors.primarycolor,
        actions: [
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                saveImage(context, APIURL.imageurl + image.toString());
              },
              child: Icon(Icons.download)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: PhotoViewGallery.builder(
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(APIURL.imageurl + image.toString()),
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        // Set the background color to the "classic white"
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
