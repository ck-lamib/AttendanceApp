import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:flutter/material.dart';

class PopUpNavigation extends StatelessWidget {
  const PopUpNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 100, minHeight: 20, minWidth: 20, maxWidth: 100),
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffFBE9FF),
            border: Border.all(width: 1, color: AppColor.dark),
            // boxShadow: [BoxShadow(color: AppColor.dark, spreadRadius: 5, blurRadius: 10)],
          ),
          child: PopupMenuButton(
            // color: backgroundColor,
            // constraints: BoxConstraints(minHeight: 10, minWidth: 10),
            position: PopupMenuPosition.over,
            onSelected: (value) {
              // if (value == "FeedPage") {
              //   Get.offNamed(FeedPage.routeName);
              // } else if (value == "ExercisePage") {
              //   Get.offNamed(ExercisePage.routeName);
              // } else if (value == "ToolPage") {
              //   Get.offNamed(ToolsPage.routeName);
              // } else if (value == "ProfilePage") {
              //   Get.offNamed(ProfilePage.routeName);
              // }
              // dc.delete(index: index);

              // getLikeController.isLoading.value = true;
              // getLikeController.getPostLike(post.post!.id.toString());
              // getLikeController.posterName.value = post.poster!.name!.capitalize!;
              // Get.toNamed(ListLike.routeName);
            },
            child: const Icon(
              Icons.add,
              color: AppColor.main,
              size: 40,
            ),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: "FeedPage",
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF393E46),
                      ),
                      child: const Icon(
                        Icons.newspaper,
                        size: 40,
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Feed Page",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "ExercisePage",
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF393E46),
                      ),
                      child: const Icon(
                        Icons.fitness_center,
                        size: 40,
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Exercise Page",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "ToolPage",
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF393E46),
                      ),
                      child: const Icon(
                        Icons.construction,
                        size: 40,
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Tools Page",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "ProfilePage",
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF393E46),
                      ),
                      child: const Icon(
                        Icons.person_outlined,
                        size: 40,
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Profile Page",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
