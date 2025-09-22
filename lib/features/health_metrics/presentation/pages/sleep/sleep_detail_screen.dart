import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../../shared/constants/app_constants.dart';
import '../../../../../shared/widgets/custom_widgets.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
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
            const Text('SAT 24 MAY'),
            const SizedBox(width: 8),
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
          children: [
            // Sleep Card
            CustomCard(
              margin: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sleep Label
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                    ),
                    child: Text(
                      'SLEEP',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.paddingLarge),

                  // Sleep Score with Semi-circular Chart
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 100,
                      child: CustomPaint(
                        painter: SemiCircularChartPainter(
                          progress: 0.83, // 83%
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '83',
                                style: AppTextStyles.headlineLarge.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.paddingLarge),

                  // Sleep Description
                  Text(
                    'More is more when it comes to sleep. Getting enough sleep volume is probably the most important lever when it comes to sleep health. Doing this consistently helps the body to do the necessary repair work everyday.',
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSizes.paddingLarge),

                  // Sleep Time Range
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('11:35 PM', style: AppTextStyles.bodyMedium),
                      Text('7:15 AM', style: AppTextStyles.bodyMedium),
                    ],
                  ),

                  const SizedBox(height: AppSizes.paddingMedium),

                  // Sleep Duration and Cycles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '6h 40m',
                            style: AppTextStyles.headlineSmall.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            'SLEEP DURATION',
                            style: AppTextStyles.bodySmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: AppColors.success,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '3 full',
                                style: AppTextStyles.headlineSmall.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          Text('SLEEP CYCLES', style: AppTextStyles.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Dynamic Recovery Card
            CustomCard(
              margin: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DYNAMIC RECOVERY +1 due to stress rhythm',
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: AppSizes.paddingLarge),

                  // Recovery Score
                  Center(
                    child: Text(
                      '84',
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: AppColors.primary,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.paddingMedium),

                  // Progress Bar
                  ProgressBar(progress: 0.84, height: 8),

                  const SizedBox(height: AppSizes.paddingSmall),

                  Text(
                    '5/6 metrics within range',
                    style: AppTextStyles.bodyMedium,
                  ),

                  const SizedBox(height: AppSizes.paddingMedium),

                  // Metrics Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMetricItem('RHR', Icons.favorite, true),
                      _buildMetricItem('Temp', Icons.thermostat, true),
                      _buildMetricItem('HRV', Icons.show_chart, true),
                    ],
                  ),

                  const SizedBox(height: AppSizes.paddingMedium),

                  // Add Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.textPrimary,
                        size: 20,
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

  Widget _buildMetricItem(String label, IconData icon, bool isGood) {
    return Column(
      children: [
        Icon(
          icon,
          color: isGood ? AppColors.success : AppColors.error,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.bodySmall),
      ],
    );
  }
}

class SemiCircularChartPainter extends CustomPainter {
  final double progress;
  final Color color;

  SemiCircularChartPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final backgroundPaint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2 - 20;

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
