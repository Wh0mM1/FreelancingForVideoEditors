import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_video/screens/utils/vid_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
          child: Container(
        // margin: EdgeInsets.all(10),
        child: ListView(children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(),
              color: Color.fromRGBO(10, 23, 51, 1),
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.76,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    maxLines: 1,
                    decoration: InputDecoration(
                      counterStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: vidList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(10, 23, 51, 1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: const Color.fromARGB(255, 7, 84, 216))
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              vidList[index].imageURL,
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [BoxShadow(blurRadius: 10)],
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.22,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          vidList[index].projectName,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ]),
      )),
    );
  }
}
