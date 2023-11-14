import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/models/hotel_model.dart';
import 'package:flutter_advanced_ui/screens/hotels_details_page.dart';
import 'package:flutter_advanced_ui/shared/widget_extension.dart';
import 'package:flutter_advanced_ui/widgets/hotel_card_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import '../shared/theme_constants.dart';
import '../widgets/Home_tab_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    int _activeTap=0;
    int _activeCardIndex=0;
    final SwipeableCardSectionController _controller= SwipeableCardSectionController();
    final List<HotelModel>_hotels=[
        HotelModel(
          "https://images.unsplash.com/photo-1563911302283-d2bc129e7570?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
          "Siargao Luxury Resort", 
          "siargo Island, Philippiness"),

          HotelModel(
          "https://images.unsplash.com/photo-1601701119495-d6e39b664001?auto=format&fit=crop&q=80&w=1964&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
          "Siargao Luxury Resort", 
          "siargo Island, Philippiness"),

          HotelModel(
          "https://images.unsplash.com/photo-1540541338287-41700207dee6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
          "Siargao Luxury Resort", 
          "siargo Island, Philippiness"),
    ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children:List.generate(4,(index)=>HomeTabBar(
                  label:"All",
                  count:124,
                  isActive: _activeTap==index,
                   onTap: () { 
                     setState(() {
                       _activeTap=index;
                     });
                    },
                )).addSeparator( SizedBox(width: context.screenWidth*0.03,))
              ),
            ),
            const SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Text(
                        "Popular Hotels",
                        style: TextStyle(
                          color: AppColors.secondryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        ),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).copyWith(right: 0),
                          child:const Row(
                            children: [
                              Text(
                                "see all",
                                style: TextStyle(
                              color: AppColors.secondryColor,
                              fontSize: 16,
                            ),
                              ),
                               SizedBox(width: 6,),
                              Icon(Icons.arrow_forward_ios_rounded, size: 20,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Swiper(
              itemCount: _hotels.length,
              itemBuilder: (_,index)=>InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HotelDelaitsPage(model: _hotels[index],)));
                },
                child: HotelCardView(hotelModel: _hotels[index])),
              onIndexChanged: (index){
                _activeCardIndex=index;
                setState(() {});
              },
              layout: SwiperLayout.TINDER,
              itemWidth: context.screenWidth,
              itemHeight: context.screenWidth,
            ),

            // SizedBox(
            //   height: MediaQuery.sizeOf(context).width*0.7,
            //   width: MediaQuery.sizeOf(context).width,
            //   child: SwipeableCardsSection(
            //     cardController: _controller,
            //   context: context,
            //   //add the first 3 cards (widgets)
            //   items: [
            //     HotelCardView(hotelModel: _hotels[0], ),
            //     HotelCardView(hotelModel: _hotels[1], ),
            //     HotelCardView(hotelModel: _hotels[2],),
            //   ],
            //   //Get card swipe event callbacks
            //   onCardSwiped: (dir, index, widget) {
            //     _activeCardIndex=(index+1)%(_hotels.length);
            //     setState(() {    
            //     });

            //   },
            //   //
            //   enableSwipeUp: true,
            //   enableSwipeDown: false,
            //           ),
            // ),

            const SizedBox(height:12,),
            AnimatedSmoothIndicator(
              activeIndex: _activeCardIndex, 
              count: _hotels.length,
              effect: const ScrollingDotsEffect(
                dotColor: AppColors.greyColor,
                activeDotColor: AppColors.secondryColor,
                dotWidth: 9,
                dotHeight: 9,
              ),
              
              )
          ],
        ),
      );
    
  }
}