import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/controller/product_controller.dart';
import 'package:my_task/model/serviceItemModel.dart';
import 'package:my_task/view/addProduct_screen.dart';
import 'package:my_task/view/profile_screen.dart';
import 'package:my_task/view/serviceDetails_screen.dart';
import 'package:my_task/widgets/reusable/custom_button.dart';
import 'package:my_task/widgets/reusable/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  late final ProductController productController;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<ProductController>()) {
      Get.put(ProductController());
    }
    productController = Get.find<ProductController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FF),
      body: Stack(
        children: [
          Container(
            height: 260,
            decoration: const BoxDecoration(
              color: Color(0xFF2565FF),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(36),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white24, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/bulb.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hi, Wade Warren!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 16, color: Colors.white),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Golder Avenue, Abuja',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Services',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTabButton('Ongoing', 0),
                          const SizedBox(width: 12),
                          _buildTabButton('Upcoming', 1),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Obx(() => GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: productController.products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.73,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemBuilder: (context, index) {
                                final product =
                                    productController.products[index];
                                final serviceItem = ServiceItem(
                                  title: product.name ?? 'No Name',
                                  category: product.category ?? 'No Category',
                                  price: product.price?.toString() ?? '0',
                                  iconData: Icons.inventory,
                                  color: const Color(0xFFE3F2FF),
                                  inStock: (product.stock ?? 0) > 0,
                                  subtitle: product.description ?? '',
                                  discount:
                                      product.discountPercent?.toString() ?? '',
                                  brand: product.brand ?? '',
                                  weight: product.weight?.toString() ?? '',
                                  dimensions: product.dimensions ?? '',
                                  status: product.isActive == true
                                      ? 'active'
                                      : 'inactive',
                                  tags: product.tags ?? [],
                                  description: product.description ?? '',
                                );
                                return ServiceCard(
                                  service: serviceItem,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ServiceDetailsScreen(
                                          service: serviceItem,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )),
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        text: 'Create Product',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddProductScreen(),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        height: 44,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2565FF) : const Color(0xFFF3F6FF),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xFFE7EAF2),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF6D7A97),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
