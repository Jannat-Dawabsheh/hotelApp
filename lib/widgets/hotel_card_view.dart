import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/models/hotel_model.dart';
import 'package:flutter_advanced_ui/shared/theme_constants.dart';
import 'package:flutter_advanced_ui/widgets/rate_widget.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class HotelCardView extends StatelessWidget {
  const HotelCardView({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(28),
                child: Image.network(hotelModel.image , fit: BoxFit.cover,)),

            ),
            Positioned(
              right: 16,
              top: 16,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                    )
                  ]
                  
                ),
                child:const  Icon(Icons.favorite , color: Color(0xfffe2372), size:25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GlassContainer(
                  width: double.infinity,
                  blur: 4,
                  color: Colors.white.withOpacity(0.1),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.6),
                      Colors.blue.withOpacity(0.8),
                    ],
                  ),
                  //--code to remove border
                  border: Border.fromBorderSide(BorderSide.none),
                  shadowStrength: 5,
                  borderRadius: BorderRadius.circular(16),
                  shadowColor: Colors.black.withOpacity(0.6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        hotelModel.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.lightsecondryColor,
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: Text(
                                hotelModel.location,
                                style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.lightsecondryColor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              ),
                            ),
                           
                             const RateWidget(doubleRate: 4.9,),  
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}