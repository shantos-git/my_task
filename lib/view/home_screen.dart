import 'package:flutter/material.dart';
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

  final List<ServiceItem> services = [
    ServiceItem(
      title: 'Headphone',
      category: 'Electronics',
      price: '22.50',
      iconData: Icons.headphones,
      color: const Color(0xFFE3F2FF),
      inStock: true,
      subtitle: 'Corsair Gaming Headphones',
      discount: '10',
      brand: 'Corsair Brand',
      weight: '0.9',
      dimensions: '45 x 13 x 2.5 cm',
      status: 'active',
      tags: const ['Peripherals Category', 'Gaming'],
      description:
          'PipeMaster Plumbing is not just a service; it’s a commitment to providing reliable and efficient plumbing solutions, ensuring your home or business runs smoothly.',
    ),
    ServiceItem(
      title: 'Smartphone',
      category: 'Electronics',
      price: '10.99',
      iconData: Icons.smartphone,
      color: const Color(0xFFEBF9F6),
      inStock: true,
      subtitle: 'Ultra Wide Display Phone',
      discount: '11',
      brand: 'Galaxy Series',
      weight: '0.18',
      dimensions: '15 x 7 x 0.8 cm',
      status: 'active',
      tags: const ['Mobile', 'Connectivity'],
      description:
          'Experience powerful performance and sleek design with advanced camera features built for modern demanding users.',
    ),
    ServiceItem(
      title: 'LED Light',
      category: 'Electronics',
      price: '12.00',
      iconData: Icons.lightbulb,
      color: const Color(0xFFFFF2E0),
      inStock: true,
      subtitle: 'Smart Home Lighting',
      discount: '8',
      brand: 'Luma Tech',
      weight: '0.4',
      dimensions: '12 x 5 x 3 cm',
      status: 'active',
      tags: const ['Lighting', 'Home'],
      description:
          'Brighten your living space with energy-efficient lighting designed for comfort and convenience.',
    ),
    ServiceItem(
      title: 'Table Fan',
      category: 'Electronics',
      price: '15.99',
      iconData: Icons.toys,
      color: const Color(0xFFF8EBFF),
      inStock: true,
      subtitle: '360° Air Circulation Fan',
      discount: '10',
      brand: 'AeroFlow',
      weight: '2.1',
      dimensions: '40 x 40 x 10 cm',
      status: 'active',
      tags: const ['Cooling', 'Outdoor'],
      description:
          'Keep cool with a powerful fan that delivers quiet, wide-angle airflow wherever you need it.',
    ),
  ];

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
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: services.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.73,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            return ServiceCard(
                              service: services[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceDetailsScreen(
                                      service: services[index],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
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
