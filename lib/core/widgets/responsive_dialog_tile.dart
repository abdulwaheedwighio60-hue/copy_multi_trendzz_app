import 'package:flutter/material.dart';

class ResponsiveDialogTile extends StatelessWidget {

  final String title;
  final String value;

  const ResponsiveDialogTile({
    super.key,
    required this.title,
    required this.value,
  });


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;


    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;


    final double fontSize =
    isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;


    final double labelWidth =
    isDesktop
        ? 110
        : isTablet
        ? 95
        : 80;


    return Padding(

      padding: EdgeInsets.only(
        bottom: isMobile ? 10 : 12,
      ),


      child: Row(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          SizedBox(

            width: labelWidth,


            child: Text(

              title,


              maxLines: 1,


              overflow:
              TextOverflow.ellipsis,


              style: TextStyle(

                fontSize: fontSize,

                fontWeight:
                FontWeight.w600,

              ),

            ),

          ),



          SizedBox(

            width:
            isMobile ? 5 : 10,

          ),



          Expanded(

            child: Text(

              value,


              maxLines: 3,


              overflow:
              TextOverflow.ellipsis,


              style: TextStyle(

                fontSize: fontSize,

                color:
                Colors.grey.shade700,

              ),

            ),

          ),


        ],

      ),

    );
  }
}