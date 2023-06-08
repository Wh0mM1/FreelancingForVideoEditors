import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_video/model/user.dart';
import 'package:freelancing_video/screens/utils/user_preferences.dart';
import 'package:freelancing_video/screens/utils/vid_data.dart';
import 'package:freelancing_video/screens/widget/appbar_widget.dart';
import 'package:freelancing_video/screens/widget/numbers_widget.dart';
import 'package:freelancing_video/screens/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
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
      backgroundColor: Color.fromRGBO(10, 23, 51, 1),
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
            const SizedBox(height: 15),
            buildName(user),
            const SizedBox(height: 15),
            NumbersWidget(),
            const SizedBox(height: 15),
            buildAbout(user),
            const SizedBox(height: 20),
            buildWork(user),
          ],
        ),
      ),
    );
  }

  bool isFollowed = false;
  String follow = "Follow";
  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.white),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "Connect",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.perm_contact_calendar_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: isFollowed
                          ? Color.fromRGBO(241, 177, 3, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {
                      userFollowed();
                    },
                    child: Text(
                      follow,
                      style: TextStyle(
                        color: Color.fromRGBO(10, 23, 51, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                user.about,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildWork(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/showcase');
                  },
                  child: Text(
                    "More",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final vid = vidList[index];
                  return Container(
                    width: 150,
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
                  );
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.amber,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   margin: EdgeInsets.all(5),
                  //   padding: EdgeInsets.all(5),
                  //   height: MediaQuery.of(context).size.height * 0.1,
                  //   width: MediaQuery.of(context).size.width * 0.3,
                  //   child: Text("Heeloo"),
                  // );
                },
              ),
            ),
            // GridView.count(

            //   primary: false,
            //   padding: EdgeInsets.all(10),
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 10,
            //   crossAxisCount: 2,
            //   children: <Widget>[
            //     ListView.builder(
            //       itemCount: 6,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: EdgeInsets.all(10),
            //           width: 50,
            //           padding: EdgeInsets.all(8),
            //           color: Colors.teal[100],
            //           child: Text("He'd have you all unravel at the"),
            //         );
            //       },
            //     ),
            //     ListView.builder(
            //       itemCount: 6,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: EdgeInsets.all(10),
            //           width: 50,
            //           padding: EdgeInsets.all(8),
            //           color: Colors.teal[100],
            //           child: Text("He'd have you all unravel at the"),
            //         );
            //       },
            //     ),
            //   ],
            // )),
          ],
        ),
      );
  void userFollowed() {
    setState(() {
      if (isFollowed) {
        isFollowed = false;
        follow = "Follow";
      } else {
        isFollowed = true;
        follow = "Unfollow";
      }
    });
  }
}
