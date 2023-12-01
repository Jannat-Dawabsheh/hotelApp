import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/models/hotel_model.dart';
import 'package:flutter_advanced_ui/shared/theme_constants.dart';
import 'package:flutter_advanced_ui/shared/widget_extension.dart';
import 'package:flutter_advanced_ui/widgets/service_list_section.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/app_custom_icon_button.dart';
import '../widgets/location_widget.dart';

class HotelDelaitsPage extends StatefulWidget {
  const HotelDelaitsPage({super.key, required this.model});
  final HotelModel model;

  @override
  State<HotelDelaitsPage> createState() => _HotelDelaitsPageState();
}

class _HotelDelaitsPageState extends State<HotelDelaitsPage> {
  final PageController _pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
         SliverAppBar(
          pinned: true,
          floating: true,
          leading: Container(
            margin: const EdgeInsets.only(left: 16),
            child: AppCustomIconButton(
              onTap: (){
                Navigator.pop(context);
              },
                   icon :  Icon(
                    CupertinoIcons.back,
                     size:25
                     ),
            ),
          ),
          leadingWidth: 70,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: const AppCustomIconButton(
                   icon :  Icon(
                    Icons.favorite ,
                    color: Color(0xfffe2372),
                    size:25),
                ),
            )
          ],
          expandedHeight: context.screenHeight*0.38,
          flexibleSpace: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                FlexibleSpaceBar(
                  background:PageView.builder(
                    controller: _pageController,
                    itemCount:4 ,
                    itemBuilder: (_,index)=>Image.network(
                      widget.model.image,
                       fit: BoxFit.cover,
                       )
                       )
                   ),
                Container(
                  margin: EdgeInsets.only(bottom: 45),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(16)),
                  ),
                   child: GlassContainer(
                  
                  blur: 4,
                  color: Colors.black.withOpacity(0.7),
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
                  borderRadius: BorderRadius.circular(0),
                  shadowColor: Colors.black.withOpacity(0.6),
                  child:const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child:  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$15.99/",
                          style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                        ),
                        Text(
                          "night",
                          style:TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          )
                        ),
                      ],
                    ),
                  ),
                   ),
                ), 
              ],
            ),
          ),
         ),
         SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: ScrollingDotsEffect(
                  activeDotColor:AppColors.secondryColor,
                  dotHeight: 7,
                  dotWidth: 7,
                  activeDotScale: 1.5,
                   ),
                )
                ),
          )
         ),
         SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:24 ,vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.name,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondryColor,
                  ),
                ),
                const SizedBox(height: 12,),
                LocationWidget(
                  location: widget.model.location,
                  rate: 4.9,
                  RateTextColor: AppColors.secondryColor,

                ),
                const SizedBox(height: 12,),
                const Divider(color: AppColors.greyColor, thickness: 1.5,),
                ServiceListSection(),
              ],
            ),
          ),
         )
        ],
      ),
    );
  }
}