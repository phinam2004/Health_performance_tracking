import 'package:flutter/material.dart';
import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/widgets/custom_widgets.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('TODAY'),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: AppColors.cardBackground,
              child: Icon(Icons.person, color: AppColors.textPrimary, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Individual Markers Section
            Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Text(
                'Individual Markers',
                style: AppTextStyles.headlineSmall,
              ),
            ),

            // Heart Rate Card
            MetricCard(
              title: 'Heart Rate',
              value: '-- --',
              icon: Icons.favorite,
              iconColor: AppColors.error,
              trailing: Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
              ),
              onTap: () {},
            ),

            // Cardio Age and Skin Temperature Row
            Row(
              children: [
                Expanded(
                  child: MetricCard(
                    title: 'Cardio Age',
                    value: '-- --',
                    trailing: Icon(
                      Icons.chevron_right,
                      color: AppColors.textSecondary,
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: MetricCard(
                    title: 'Skin Temperature',
                    value: '-- --',
                    icon: Icons.thermostat,
                    iconColor: AppColors.warning,
                    trailing: Icon(
                      Icons.chevron_right,
                      color: AppColors.textSecondary,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),

            // Timeline Section
            Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Timeline', style: AppTextStyles.headlineSmall),
                  Icon(Icons.add, color: AppColors.textPrimary, size: 24),
                ],
              ),
            ),

            // Ring Battery Card
            CustomCard(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.textSecondary,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.circle_outlined,
                      color: AppColors.textSecondary,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: AppSizes.paddingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ring Battery', style: AppTextStyles.bodyLarge),
                        const SizedBox(height: AppSizes.paddingSmall),
                        ProgressBar(progress: 1.0, height: 6),
                        const SizedBox(height: AppSizes.paddingSmall),
                        Text(
                          '100%',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.textPrimary,
        child: Icon(Icons.add, color: AppColors.background),
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
