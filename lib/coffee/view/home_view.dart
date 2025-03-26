import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controller/tabs_controller.dart';
import '../model/coffee_model.dart';
import '../providers/tabs_provider.dart';
import 'cart_view.dart';
import 'coffee_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  // for getX
  //final TabsController controller = Get.put(TabsController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var fakeData = {
      "data": [
        {
          "title": "Latte",
          "image": "assets/Latte.png",
          "subTitle": "Best coffee",
          "description":
              "Hot coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
        {
          "title": "Espresso",
          "image": "assets/Espresso.png",
          "description":
              "Hot coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "subTitle": "Best coffee",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
        {
          "title": "Black Coffee",
          "image": "assets/Black Coffee.png",
          "description":
              "Hot coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "subTitle": "Best coffee",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
        {
          "title": "Cold Coffee",
          "description":
              "Cold coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "image": "assets/Cold Coffee.png",
          "subTitle": "Best coffee",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
      ]
    };
    // for provider
    final tabsProvider = Provider.of<TabsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    size: 35,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(CartView());
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "It's a greate Day for coffe",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            // for get x
            // Obx(() {
            //   return
            //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // for provider
                  TabBarItem(
                      screenWidth: screenWidth,
                      title: 'Hot Coffee',
                      isSelected: tabsProvider.currentIndex == 0,
                      onTap: () {
                        tabsProvider.changeIndex(0);
                      }),
                  TabBarItem(
                      screenWidth: screenWidth,
                      title: 'Cold Coffee',
                      isSelected: tabsProvider.currentIndex == 1,
                      onTap: () {
                        tabsProvider.changeIndex(1);
                      }),
                  TabBarItem(
                      screenWidth: screenWidth,
                      title: 'Cappuccino',
                      isSelected: tabsProvider.currentIndex == 2,
                      onTap: () {
                        tabsProvider.changeIndex(2);
                      }),

                  // for getX
                  // TabBarItem(
                  //   screenWidth: screenWidth,
                  //   title: 'Hot Coffee',
                  //   isSelected: controller.currentIndex.value == 0,
                  //   onTap: () {
                  //     controller.changeIndex(val: 0);
                  //   },
                  // ),
                  // TabBarItem(
                  //   screenWidth: screenWidth,
                  //   title: 'Cold Coffee',
                  //   isSelected: controller.currentIndex.value == 1,
                  //   onTap: () {
                  //     controller.changeIndex(val: 1);
                  //   },
                  // ),
                  // TabBarItem(
                  //   screenWidth: screenWidth,
                  //   title: 'Cappuccino',
                  //   isSelected: controller.currentIndex.value == 2,
                  //   onTap: () {
                  //     controller.changeIndex(val: 2);
                  //   },
                  // ),
                ],
              ),
            // for get x
          //  }),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: fakeData['data']?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: screenHeight * 0.02,
                      crossAxisSpacing: screenWidth * 0.05,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return CoffeeItem(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Get.to(
                          CoffeeView(
                            coffee: Coffee(
                              title:
                                  fakeData['data']![index]['title'] as String,
                              image:
                                  fakeData['data']![index]['image'] as String,
                              description: fakeData['data']![index]
                                  ['description'] as String,
                              subTitle: fakeData['data']![index]['subTitle']
                                  as String,
                              price:
                                  fakeData['data']![index]['price'] as String,
                              quantity:
                                  fakeData['data']![index]['quantity'] as int,
                            ),
                          ),
                        );
                      },
                      image: fakeData['data']![index]['image'] as String,
                      title: fakeData['data']![index]['title'] as String,
                      description:
                          fakeData['data']![index]['description'] as String,
                      price: fakeData['data']![index]['price'] as String,
                      subTitle: fakeData['data']![index]['subTitle'] as String,
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white12,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_add), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home'),
          ]),
    );
  }
}

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.onTap,
    required this.title,
    required this.image,
    required this.description,
    required this.subTitle,
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final VoidCallback onTap;
  final String title;
  final String image;
  final String description;
  final String subTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.26,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(
          screenWidth * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: screenHeight * 0.12,
              width: screenWidth * 0.35,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$price \$",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: screenWidth * 0.05,
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final double screenWidth;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.orange : Colors.white.withOpacity(0.2),
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: screenWidth * 0.25,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isSelected ? Colors.orange : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
