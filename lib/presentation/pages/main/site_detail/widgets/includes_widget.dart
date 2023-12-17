import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triplaner/domain/entities/site.dart';
import 'package:triplaner/util/app_assets.dart';
import 'package:triplaner/util/app_style.dart';

class IncludesWidget extends StatelessWidget {
  final Site site;

  const IncludesWidget({Key? key, required this.site}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 22.h, bottom: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Includes",
                style: AppStyle.siteDetailHeading(context),
              ),
              SizedBox(height: 12.h,),
              for (var inclusion in site.inclusions!)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.includes,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      SizedBox(
                          width: 1.sw - 80.w,
                          child: Text(
                            "${inclusion.description}",
                            style: AppStyle.siteDetailSubHeading(context),
                          )),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
