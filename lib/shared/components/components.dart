import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem buildNavItem({
  required String label,
  required IconData iconData,
}) {
  return BottomNavigationBarItem(label: label, icon: Icon(iconData));
}

List<BottomNavigationBarItem> get buildNavItems => [
      buildNavItem(
        label: "Business",
        iconData: Icons.business,
      ),
      buildNavItem(
        label: "Science",
        iconData: Icons.science,
      ),
      buildNavItem(
        label: "Sports",
        iconData: Icons.sports_basketball,
      ),
      buildNavItem(
        label: "Settings",
        iconData: Icons.settings,
      ),
    ];

Widget buildNewsItem(Map<String, dynamic> newsItem) {
  String imgLink = newsItem["urlToImage"] ??
      "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";
  String publishedAt = newsItem["publishedAt"] ?? "";
  String title = newsItem["title"] ?? "";
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                    imgLink,
                  ),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 22.0,
                ),
                Text(
                  publishedAt,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildNewsList(List<dynamic> items) {
  return ConditionalBuilder(
      condition: items.isNotEmpty,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildNewsItem(items[index]),
          separatorBuilder: (context, index) => listDivider(),
          itemCount: items.length),
      fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
}

Widget listDivider() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20.0,
      end: 20.0,
    ),
    child: Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey[300],
    ),
  );
}
