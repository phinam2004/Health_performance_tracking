import 'package:flutter/material.dart';
import '../../../../../shared/constants/app_constants.dart';
import '../../../../../shared/widgets/custom_widgets.dart';

class MetabolismScreen extends StatefulWidget {
  const MetabolismScreen({super.key});

  @override
  State<MetabolismScreen> createState() => _MetabolismScreenState();
}

class _MetabolismScreenState extends State<MetabolismScreen> {
  int _selectedIndex = 1; // Metabolism tab is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient Overlay
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.background.withOpacity(0.8),
                  AppColors.background,
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Status Bar
                Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingMedium),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('9:41', style: AppTextStyles.bodyLarge),
                      Row(
                        children: [
                          Icon(
                            Icons.signal_cellular_4_bar,
                            color: AppColors.textPrimary,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.wifi,
                            color: AppColors.textPrimary,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.battery_full,
                            color: AppColors.textPrimary,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          CircleAvatar(
                            backgroundColor: AppColors.cardBackground,
                            radius: 12,
                            child: Icon(
                              Icons.person,
                              color: AppColors.textPrimary,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Main Content
                Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'Ultrahuman M1: Now out of Private Beta',
                        style: AppTextStyles.headlineLarge.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: AppSizes.paddingXLarge),

                      // Primary CTA Button
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: 'Have a Biosensor? Start Now',
                          backgroundColor: Colors.transparent,
                          textColor: AppColors.textPrimary,
                          isOutlined: true,
                          onPressed: () {},
                        ),
                      ),

                      const SizedBox(height: AppSizes.paddingMedium),

                      // Secondary CTA
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have the Biosensor yet? ",
                                  style: AppTextStyles.bodyMedium,
                                ),
                                TextSpan(
                                  text: 'Request Access',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100), // Space for bottom navigation
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'RING',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'METABOLISM',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: 'ZONES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'DISCOVER',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
