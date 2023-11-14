import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/models/hotel_model.dart';
import 'package:flutter_advanced_ui/shared/widget_extension.dart';

class HotelDelaitsPage extends StatefulWidget {
  const HotelDelaitsPage({super.key, required this.model});
  final HotelModel model;

  @override
  State<HotelDelaitsPage> createState() => _HotelDelaitsPageState();
}

class _HotelDelaitsPageState extends State<HotelDelaitsPage> {
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
          expandedHeight: context.screenHeight*0.38,
          flexibleSpace: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: FlexibleSpaceBar(
              title: Text(
                widget.model.name,
                style:TextStyle(color: Colors.white, fontSize: 16),
              ),
              background:Image.network(widget.model.image, fit: BoxFit.cover,)
               ),
          ),
         ),
         SliverList(
          delegate: SliverChildBuilderDelegate(
            (context,index)=>Text(
              "Item $index",
              style:TextStyle(
                fontSize: 16,
                color: Colors.black,
              )
            ),
            childCount:30,
          ),
         )
        ],
      ),
    );
  }
}