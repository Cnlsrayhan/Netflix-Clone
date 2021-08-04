import 'package:flutter/material.dart';
import 'package:netflix_clone/json/root_app_json.dart';
import 'package:netflix_clone/pages/coming_soon_page.dart';
import 'package:netflix_clone/pages/download_page.dart';
import 'package:netflix_clone/pages/home_page.dart';
import 'package:netflix_clone/pages/search_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [Home(), ComingSoon(), SearchPage(), DownloadPage()],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      items[index]['icon'],
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      items[index]['text'],
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
