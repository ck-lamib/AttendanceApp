import 'dart:io';

import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  pickImage(BuildContext context) async {
    var theme = Theme.of(context);
    File? image;
    ImagePicker imagePicker = ImagePicker();
    await showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Choose an image source",
                style: theme.textTheme.titleMedium?.copyWith(color: AppColor.main),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShortCutTile(
                  icon: const Icon(
                    Icons.camera,
                    color: AppColor.lightPink,
                  ),
                  iconName: "Camera",
                  onTap: () async {
                    XFile? xFile = await imagePicker.pickImage(source: ImageSource.camera);
                    if (xFile != null) {
                      image = File(xFile.path);
                    }
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
                ShortCutTile(
                  icon: const Icon(
                    Icons.folder,
                    color: AppColor.lightPink,
                  ),
                  iconName: "Gallery",
                  onTap: () async {
                    XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
                    if (xFile != null) {
                      image = File(xFile.path);
                    }
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
    return image;
  }

  Future<File?> cropImage(
    File file, {
    double? height,
    double? width,
    CropStyle cropStyle = CropStyle.rectangle,
  }) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: (height == null || width == null)
          ? null
          : CropAspectRatio(
              ratioX: width,
              ratioY: height,
            ),
      cropStyle: cropStyle,
      compressFormat: ImageCompressFormat.png,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Crop Image",
          toolbarColor: AppColor.dark,
          toolbarWidgetColor: AppColor.lightPink,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          backgroundColor: AppColor.dark,
          statusBarColor: AppColor.dark,
        ),
        IOSUiSettings(
          title: "Crop Image",
          showCancelConfirmationDialog: true,
        ),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return null;
    }
  }

  Future<File?> pickAndCropImage(BuildContext context) async {
    File? finalFile;
    File? file = await pickImage(context);
    if (file != null) {
      finalFile = await cropImage(file);
    } else {}
    return finalFile;
  }
}

class ShortCutTile extends StatelessWidget {
  const ShortCutTile({
    super.key,
    this.boxWidth,
    required this.icon,
    required this.iconName,
    this.onTap,
  });

  final double? boxWidth;
  final Widget icon;
  final String iconName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: boxWidth ?? width * 0.3),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            // border: Border.all(color: AppColor.dark),
            color: AppColor.dark),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.main,
              ),
              child: icon,
            ),
            Text(
              iconName,
              style: theme.textTheme.bodySmall?.copyWith(color: AppColor.lightPink),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
