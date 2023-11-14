import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/shared/theme_constants.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key, required this.label, required this.count, this.isActive=false, required this.onTap});
  final String label;
  final int count;
  final bool isActive;
  final VoidCallback onTap;
  

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isActive? AppColors.secondryColor:  Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child:InkWell(
        onTap: onTap,
        child: Row(
          children:[
            Text(label,
            style: TextStyle(
               color: isActive? Colors.white: AppColors.secondryColor,
               fontSize: 16,
            )),
            const SizedBox(width:8),
            Text('$count',
            style: TextStyle(
               color:AppColors.lightsecondryColor,
               fontSize: 16,
            )),
          ],
        ),
      )
    );
  }
}