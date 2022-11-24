
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:shimmer/shimmer.dart';



class CachImageWidght extends StatelessWidget{

  final String url ;
  final double width;
  final double height;

  const  CachImageWidght({required this.url,required this.height,required this.width});
  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: ColorManager.yellowColor,
        highlightColor: ColorManager.iconColor1,
        child: Container(
          height: 170.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: ColorManager.yellowColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error,color: ColorManager.mainColor,),
    );
  }
}