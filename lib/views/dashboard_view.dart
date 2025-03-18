import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_task/widgets/shimmer_loading.dart';
import 'package:flutter_desktop_app_task/constants/app_colors.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading) {
      return const ShimmerLoading();
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColors.appDashboardBackground,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Card(
                        color: AppColors.appVehicleCardBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      color: AppColors.armedStatus,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'ARMED',
                                    style: TextStyle(
                                      fontFamily: 'AlternateGotNo3D',
                                      color: AppColors.armedStatus,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 9,
                                        child: Image.asset(
                                          'assets/bike_img.png',
                                          fit: BoxFit.contain,
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return Container(
                                              color: Colors.grey[700],
                                              child: const Center(
                                                child: Icon(
                                                  Icons.motorcycle,
                                                  size: 100,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      // Container(
                                      //   height: 10,
                                      //   width: 300,
                                      //   margin: const EdgeInsets.only(top: 0),
                                      //   decoration: BoxDecoration(
                                      //     color: Colors.black.withOpacity(0.3),
                                      //     borderRadius: BorderRadius.circular(50),
                                      //     boxShadow: [
                                      //       BoxShadow(
                                      //         color: Colors.black.withOpacity(
                                      //           0.15,
                                      //         ),
                                      //         blurRadius: 50,
                                      //         spreadRadius: 20,
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ),
                              const Text(
                                '2024 DSR/X',
                                style: TextStyle(
                                  fontFamily: 'AlternateGotNo3D',
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DUAL SPORT',
                                    style: TextStyle(
                                      fontFamily: 'AlternateGotNo3D',
                                      color: Colors.white70,
                                      fontSize: 16,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    'VIN: 219479120142',
                                    style: TextStyle(
                                      fontFamily: 'AlternateGotNo3D',
                                      color: Colors.white70,
                                      fontSize: 16,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 3,
                      child: Card(
                        color: theme.cardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFECF3FC), Color(0xFFCCDAEB)],
                              stops: [0.3, 1.0],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'FAULTS',
                                          style: TextStyle(
                                            fontFamily: 'AlternateGotNo3D',
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.2,
                                            color:
                                                theme
                                                    .textTheme
                                                    .titleLarge
                                                    ?.color,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: const BoxDecoration(
                                            color: AppColors.faultBadge,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Text(
                                            '1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/fault_symbol.png',
                                    width: 200,
                                    height: 200,
                                    alignment: Alignment.center,
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 120),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: AppColors.faultNumberBadge,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '01',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'High Throttle',
                                            style: TextStyle(
                                              fontFamily: 'AlternateGotNo3D',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  theme
                                                      .textTheme
                                                      .titleMedium
                                                      ?.color,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const SizedBox(
                                            width: 200,
                                            child: Text(
                                              'Likely throttle connection or potentiometer issue',
                                              maxLines: 2,

                                              style: TextStyle(
                                                letterSpacing: 1.1,
                                                fontFamily: 'AlternateGotNo3D',
                                                color:
                                                    AppColors.appTextSecondary,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor:
                                              AppColors.primaryDark,
                                          elevation: 10,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 12,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                          shadowColor: Colors.black,
                                        ),
                                        child: const Text(
                                          'Troubleshoot',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 1,
                                  color: AppColors.appDivider,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Card(
                          color: AppColors.appBottomCardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            width: 300,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // gradient: const LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [Color(0xFFECF3FC), Color(0xFFCCDAEB)],
                              //   stops: [0.3, 1.0],
                              // ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 24.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '12V',
                                    style: const TextStyle(
                                      fontFamily: 'AlternateGotNo3D',
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    'BATTERY VOLTAGE',
                                    style: TextStyle(
                                      fontFamily: 'AlternateGotNo3D',
                                      color: AppColors.appText,
                                      fontSize: 12,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 24),
                        Card(
                          color: AppColors.appBottomCardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            width: 300,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // gradient: const LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [Color(0xFFECF3FC), Color(0xFFCCDAEB)],
                              //   stops: [0.3, 1.0],
                              // ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 24.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.bolt,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      Text(
                                        '56%',
                                        style: const TextStyle(
                                          fontFamily: 'AlternateGotNo3D',
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const Text(
                                    'STATE OF CHARGE',
                                    style: TextStyle(
                                      fontFamily: 'AlternateGotNo3D',
                                      color: AppColors.appText,
                                      fontSize: 12,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(130),
                      ),
                      child: Container(
                        width: 350,
                        height: 100,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(30),
                        // ),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(190),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Start Repair',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.double_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
