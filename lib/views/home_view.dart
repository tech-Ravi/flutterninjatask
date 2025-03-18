import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_task/views/dashboard_view.dart';
import 'package:flutter_desktop_app_task/views/feedback_view.dart';
import 'package:flutter_desktop_app_task/views/settings_view.dart';
import 'package:flutter_desktop_app_task/widgets/shimmer_loading.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _isLoading = false;
  late TabController _tabController;

  final List<Widget> _pages = [
    const DashboardView(),
    const FeedbackView(),
    const SettingsView(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: _selectedIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _isLoading = true;
        _selectedIndex = index;
        _tabController.animateTo(index);
      });

      // Simulate loading delay
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        actionsPadding: EdgeInsets.all(0),
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/logo.png',
            width: 50,
            height: 50,
            fit: BoxFit.fill,
            errorBuilder:
                (context, error, stackTrace) =>
                    Icon(Icons.electric_bike, size: 40, color: Colors.black),
          ),
        ),
        title: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              _buildTabButton(
                context,
                'DASHBOARD',
                0,
                selectedColor: const Color(0xFFFF4D4D),
              ),
              _buildTabButton(context, 'FEEDBACK', 1),
              _buildTabButton(context, 'SETTINGS', 2),
            ],
          ),
        ),
        centerTitle: true,
        actions: [const SizedBox(width: 80)],
      ),
      body: Container(
        //color: AppColors.appDashboardBackground,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child:
              _isLoading
                  ? _selectedIndex == 0
                      ? const ShimmerLoading()
                      : const ShimmerListLoading()
                  : _pages[_selectedIndex],
        ),
      ),
    );
  }

  Widget _buildTabButton(
    BuildContext context,
    String title,
    int index, {
    Color? selectedColor,
  }) {
    final isSelected = _selectedIndex == index;
    final theme = Theme.of(context);
    final effectiveSelectedColor = selectedColor ?? Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => _onItemTapped(index),
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor:
                  isSelected
                      ? effectiveSelectedColor
                      : theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'AlternateGotNo3D',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                color: effectiveSelectedColor,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
        ],
      ),
    );
  }
}
