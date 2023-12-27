import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheen_ai_application/controllers/categories_controllers.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoriesController cgController = Get.put(CategoriesController());
  TextEditingController searchQuery = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  label: Text('Back'),
                ),
                Text('Categories'),
                IconButton(onPressed: () {}, icon: Icon(Icons.call))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_drop_down_circle),
                        Text('Sort'),
                      ],
                    ),
                    Text('Price High to Low')
                  ],
                ),
                VerticalDivider(
                  color: Colors.blue,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.filter_list_alt),
                        Text('Filter'),
                      ],
                    ),
                    Text('98456 designs')
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Gold')),
                ElevatedButton(onPressed: () {}, child: Text('Rose Gold')),
                ElevatedButton(onPressed: () {}, child: Text('5g-15g')),
                ElevatedButton(
                    onPressed: () {}, child: Text('Peacock Collection')),
                TextButton(onPressed: () {}, child: Text('Clear All'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: searchQuery,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    child: Icon(Icons.indeterminate_check_box_rounded),
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(child: Text('Hey')),
                    );
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: [
              Icon(Icons.home),
              Text('Home'),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined)),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
