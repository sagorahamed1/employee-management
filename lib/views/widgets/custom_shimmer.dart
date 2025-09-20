import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';



class CustomShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Shimmer for images or icons
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Shimmer for task title text
                            Container(
                              height: 15,
                              width: double.infinity,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            // Shimmer for task category text
                            Container(
                              height: 12,
                              width: 100,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            // Shimmer for schedule and pay details
                            Container(
                              height: 12,
                              width: 120,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}





class ShimmerServiceCard extends StatelessWidget {
  const ShimmerServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [

          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,   // background color
            highlightColor: Colors.grey.shade100, // moving shimmer color
            child: Container(
              height: 210.h,
              width: 165.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
      
      
          SizedBox(width: 10.w),

          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,   // background color
            highlightColor: Colors.grey.shade100, // moving shimmer color
            child: Container(
              height: 210.h,
              width: 165.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          )
      
      
        ],
      ),
    );
  }
}
