import 'package:flutter/material.dart';
import 'package:my_task/model/serviceItemModel.dart';

class ServiceCard extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback? onTap;

  const ServiceCard({
    required this.service,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFF),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    service.category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6D7A97),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2565FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '\$${service.price}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: service.color,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Hero(
                    tag: service.title,
                    child: Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Icon(
                          service.iconData,
                          color: const Color(0xFF2565FF),
                          size: 44,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: service.inStock ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        service.inStock ? 'In Stock' : 'Out of Stock',
                        style: TextStyle(
                          color: service.inStock ? Colors.green : Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
