import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/view/signIn_screen.dart';
import 'package:my_task/widgets/reusable/profile_option_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: const [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'W',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2565FF),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2565FF),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Wade Warren',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(),
            Column(
              children: [
                ProfileOptionTile(
                  icon: Icons.edit_outlined,
                  title: 'Edit Profile',
                  onTap: () {},
                ),
                ProfileOptionTile(
                  icon: Icons.support_agent_outlined,
                  title: 'Support',
                  onTap: () {},
                ),
                ProfileOptionTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy',
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SigninScreen());
                    },
                    child: Container(
                      color: Colors.white,
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            color: Color(0xFFF1B900),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF1B900),
                            ),
                          ),
                        ],
                      ),
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
