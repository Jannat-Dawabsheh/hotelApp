import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/widgets/rate_widget.dart';

import '../shared/theme_constants.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location, required this.rate, this.RateTextColor});
  final String location;
  final double rate;
  final Color? RateTextColor; 
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Icon(
            Icons.location_on,
            color: AppColors.lightsecondryColor,
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: Text(
                location,
                style: const TextStyle(
                fontSize: 14,
                color: AppColors.lightsecondryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              ),
            ),
            
              RateWidget(doubleRate: rate, textColor: RateTextColor,),  
        ],
      );
                      
  }
}