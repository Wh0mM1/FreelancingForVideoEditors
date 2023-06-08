import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_video/model/video_model.dart';
import 'package:freelancing_video/screens/utils/vid_data.dart';

class ShowCasingScreen extends StatefulWidget {
  const ShowCasingScreen({super.key});

  @override
  State<ShowCasingScreen> createState() => _ShowCasingScreenState();
}

class _ShowCasingScreenState extends State<ShowCasingScreen> {
  List<String> catList = [
    'All',
    'Gaming',
    'Entertainment',
    'Music',
    'Educational'
  ];
  List<String> catListImage = [
    'https://www.searchenginejournal.com/wp-content/uploads/2021/11/digital-video-advertising-61cbfa8047963-sej.png',
    'https://media.wired.com/photos/627da1085d49787abdf713b4/191:100/w_1280,c_limit/Pakistani-Gamers-Want-a-Seat-at-the-Table-Culture-shutterstock_1949862841.jpg',
    'https://reflectionsglobal.com/wp-content/uploads/2020/10/media_entertainment.png',
    'https://images.pexels.com/photos/3587478/pexels-photo-3587478.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.hindustantimes.com/rf/image_size_640x362/HT/p2/2015/12/01/Pictures/_c34102da-9849-11e5-b4f4-1b7a09ed2cea.jpg'
  ];
  List<Vid> accCat = vidList;
  void getCatData(String str) {
    for (int i = 0; i < vidList.length; i++) {
      // print(str);
      if (str == "All") {
        accCat = vidList;
      }
      if (vidList[i].category == str) {
        accCat.add(vidList[i]);
        print(vidList[i].projectName);
      }
    }
    print(accCat.length);
    setState(() {});
  }

  List<IconData> iconList = [
    Icons.home_filled,
    Icons.video_camera_front_rounded
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Color.fromRGBO(10, 23, 51, 1),
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            if (index == 0) {
              Navigator.pushNamed(context, '/showcase');
            }
            if (index == 1) {
              Navigator.pushNamed(context, '/search');
            }
            if (index == 2) {
              Navigator.pushNamed(context, '/profilepage');
            }
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.pink,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
              activeColor: Colors.purpleAccent,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              height: MediaQuery.of(context).size.height * 0.18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Discover",
                    style: TextStyle(
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: catList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            accCat = [];
                            getCatData(catList[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        catListImage[index],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(10, 23, 51, 1),
                                        blurRadius: 3,
                                      )
                                    ],
                                  ),
                                ),
                                Text(catList[index]),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.69,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                ),
                itemCount: accCat.length,
                itemBuilder: (context, index) {
                  final vid = accCat[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/details');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(10, 23, 51, 1),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(blurRadius: 2)]),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  vid.imageURL,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                          ),
                          Text(
                            vid.projectName,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
