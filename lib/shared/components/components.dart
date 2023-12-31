import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';

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

Widget buildNewsItem(BuildContext context, Map<String, dynamic> newsItem) {
  String imgLink = newsItem["urlToImage"] ??
      "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";
  String publishedAt = newsItem["publishedAt"] ?? "";
  String title = newsItem["title"] ?? "";
  String url = newsItem["url"] ?? "";
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(url: url));
    },
    child: Padding(
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
    ),
  );
}

Widget buildNewsList(List<dynamic> items, {isSearch = false}) {
  return ConditionalBuilder(
      condition: items.isNotEmpty,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildNewsItem(context, items[index]),
          separatorBuilder: (context, index) => listDivider(),
          itemCount: items.length),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
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

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String label,
  required String? Function(String?) validate,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function(String)? onSubmit,
  Function()? onTap,
  Function(String)? onChanged,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    validator: validate,
    obscureText: isPassword,
    decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        prefix: Icon(prefix),
        suffix: suffix != null ? Icon(suffix) : null),
    onFieldSubmitted: onSubmit,
    onTap: onTap,
    onChanged: onChanged,
  );
}

void navigateTo(BuildContext context, Widget toWidget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => toWidget));
}
