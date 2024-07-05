import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sunstar/constant/font.dart';
import 'package:sunstar/screens/float_switch.dart';
import 'package:sunstar/screens/products_detail.dart';
import 'package:sunstar/screens/spare_products.dart';
import 'package:sunstar/widget/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chaitran Ravi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFonts.Satoshi,
                        ),
                      ),
                      Text(
                        "11A Gandhi street, Pleasant Nagar..",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFonts.Satoshi,
                          color: Color.fromRGBO(78, 80, 91, 1),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(31, 93, 165, 1),
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      onTap: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  controller: TextEditingController(),
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: AppFonts.Satoshi,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                    border: InputBorder.none,
                    prefixIcon: Container(
                      // decoration: BoxDecoration(
                      //   color: const Color.fromRGBO(7, 81, 204, 1),
                      //   borderRadius: BorderRadius.circular(8.0),
                      // ),
                      child: const Icon(Icons.search, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Text(
                  //   "Categories",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: AppFonts.Satoshi,
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: _imageUrls.map((url) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _imageUrls.asMap().entries.map((entry) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == entry.key
                                    ? const Color.fromRGBO(31, 93, 165, 1)
                                    : Colors.white,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.Satoshi,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCategoryButton(
                      "Product",
                      const Icon(Icons.shopping_cart_outlined),
                      // SvgPicture.asset(
                      //   "assets/icons/cart.svg",
                      //   fit: BoxFit.scaleDown,
                      // ),
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductsDetails()));
                      },
                    ),
                    const SizedBox(width: 8),
                    buildCategoryButton(
                      "Spare Product",
                      null,
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SpareProducts()));
                      },
                    ),
                    const SizedBox(width: 8),
                    buildCategoryButton(
                      "Float Switch",
                      null,
                      () {
                        // Navigation logic for Float Switch
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FloatSwitchdetail()));
                      },
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Our Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.Satoshi,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.Manrope,
                      color: Color.fromRGBO(78, 80, 91, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(31, 93, 165, 1),
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
