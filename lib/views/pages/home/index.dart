import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheen_ai_application/constants.dart';
import 'package:sheen_ai_application/controllers/categories_controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController cgController = Get.put(HomeController());
  TextEditingController searchQuery = TextEditingController();
  showDialogOptions() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Set border radius
              ),
              //contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 200),
              elevation: 0,
              //contentPadding: EdgeInsets.all(0.0),
              title: Text('Sort'),
              content: Column(children: [
                GestureDetector(
                  onTap: () {
                    cgController.sortData(sortMethod: "asc");
                    cgController.currFilter.value = cgController.list[0];
                    Get.back();
                  },
                  child: ListTile(
                    leading: Icon(Icons.filter_alt_outlined),
                    title: Text(cgController.list[0]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cgController.sortData(sortMethod: "des");
                    cgController.currFilter.value = cgController.list[1];
                    Get.back();
                  },
                  child: ListTile(
                    leading: Icon(Icons.filter_alt_outlined),
                    title: Text(cgController.list[1]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // cgController.sortData(sortMethod: "asc");
                    cgController.currFilter.value = cgController.list[2];
                  },
                  child: ListTile(
                    leading: Icon(Icons.filter_alt_outlined),
                    title: Text(cgController.list[2]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // cgController.sortData(sortMethod: "asc");
                    cgController.currFilter.value = cgController.list[3];
                    Get.back();
                  },
                  child: ListTile(
                    leading: Icon(Icons.filter_alt_outlined),
                    title: Text(cgController.list[3]),
                  ),
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: screenwidth / 4,
        toolbarHeight: screenHeight / 26,
        title: Container(
            //margin: EdgeInsets.only(top: 10),
            child: cusText('Categories', 25)),
        leading: Container(
          // margin: EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_outlined,
                size: 12,
              ),
              Container(child: cusText('Back', 25, textColor: blueColor))
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset('assets/icons/call.png'),
            height: 50,
            width: 60,
          )
        ],
      ),
      body: Obx(() {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 7,
            ),
            Divider(
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => showDialogOptions(),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/sort.png',
                            height: 45,
                            width: 50,
                            color: blueColor,
                          ),
                          cusText('Sort', 30, textColor: blueColor)
                        ],
                      ),
                    ),
                    mediumText(cgController.currFilter.value)
                  ],
                ),
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/filter.png',
                          height: 45,
                          width: 50,
                          color: blueColor,
                        ),
                        cusText('Filter', 30, textColor: blueColor)
                      ],
                    ),
                    mediumText('98456 designs')
                  ],
                ),
              ],
            ),
            Row(
              children: [
                customElevatedButton('Gold', context, () {}),
                customElevatedButton('Rose Gold', context, () {}),
                customElevatedButton('5g-15g', context, () {}),
                customElevatedButton('Peacock Collection', context, () {}),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: smallText('Clear All',
                      textColor: Colors.red, Boldness: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 17),
                  width: screenwidth / 2.15,
                  child: TextField(
                    controller: searchQuery,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: blueColor,
                        size: 30,
                      ),
                      // prefixIcon: SizedBox(
                      //   Icon(Icons.search)
                      //   width: 10, // Set the width as needed
                      //   height: 10, // Set the height as needed
                      //   child: Image.asset(
                      //     'assets/icons/search.png',
                      //     // fit: BoxFit.contain, // Adjust the fit as needed
                      //   ),
                      // ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: blueColor)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  child: Image.asset(
                    'assets/icons/menu_t.png',
                    height: 40,
                    width: 50,
                    color: blueColor,
                  ),
                )
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: cgController.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While data is being fetched, show a loading indicator
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If there's an error, display an error message
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.7,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0),
                          itemCount: cgController.recordList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              //semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              surfaceTintColor:
                                  Color.fromARGB(255, 221, 132, 243),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: InkWell(
                                          onTap: () {
                                            // Handle checkbox click
                                          },
                                          child: Container(
                                            width:
                                                24.0, // Adjust width as needed
                                            height:
                                                24.0, // Adjust height as needed
                                            decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: blueColor),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              size: 30.0,
                                              color: blueColor,
                                            ),
                                          ))),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://storage.googleapis.com/upload-microservice-dev.appspot.com/data-engine/6537943656a2d2000b0a42d8/category/3.jpeg',
                                          // height: 150,
                                          // width: 150,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        mediumText('Gld Wt: ',
                                            textColor: blueColor),
                                        cusText(
                                          '${cgController.recordList[index].grossWeight}g',
                                          19,
                                          textColor: blueColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        mediumText('Dia Wt: ',
                                            textColor: blueColor),
                                        cgController.recordList[index].netWeight
                                                    .toString()
                                                    .length <
                                                4
                                            ? cusText(
                                                '${cgController.recordList[index].netWeight}g',
                                                19,
                                                textColor: blueColor)
                                            : cusText(
                                                '${cgController.recordList[index].netWeight.toString().substring(0, 4)}g',
                                                19,
                                                textColor: blueColor,
                                              ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        mediumText('No. ',
                                            textColor: blueColor),
                                        Text(
                                          '${cgController.recordList[index].styleNo}',
                                          style: TextStyle(
                                              fontSize: 19, color: blueColor),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        mediumText('Rs ', textColor: blueColor),
                                        cusText(
                                          '${cgController.recordList[index].jewelPrice}',
                                          19,
                                          textColor: blueColor,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Text(
                                  //     'Dia Wt: ${cgController.recordList[index].netWeight}'),
                                  // Text(
                                  //     'Style No. ${cgController.recordList[index].styleNo} '),
                                  // Text(
                                  //     'Rs. ${cgController.recordList[index].jewelPrice!.toInt().toString()} ')

                                  // CheckboxListTile(
                                  //     value: true,
                                  //     onChanged: (value) => {value = false})
                                ],
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            //   Icon(Icons.home),
            Badge(
                //largeSize: 0,
                offset: Offset(4, -13),
                label: Text('3'),
                child: mediumText(
                  'Add Selected\n to Cart',
                  Boldness: FontWeight.w700,
                )),
          ],
        ),
        //  backgroundColor: Colors.bl,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        unselectedLabelStyle: TextStyle(fontSize: 0),
        selectedLabelStyle: TextStyle(fontSize: 0),
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedIconTheme: IconThemeData(
          color: Colors.blue, // Set the color for the selected icon
          size: 40, // Set the size for the selected icon
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/menu.png',
              height: 30,
              width: 30,
              color: blueColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/note.png',
              height: 30,
              width: 30,
              color: blackColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, size: 40),
            label: '',
          ),
        ],
      ),
    );
  }
}
