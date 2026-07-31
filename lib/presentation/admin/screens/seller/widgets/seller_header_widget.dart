import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class SellerHeaderWidget extends StatelessWidget {

  final VoidCallback? onAddSeller;
  final Function(String)? onSearch;
  final Function(String)? onStatusChanged;
  const SellerHeaderWidget({
    super.key,
    this.onAddSeller,
    this.onSearch,
    this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width >= 1200;
    final bool isTablet = width >= 700 && width < 1200;
    final bool isMobile = width < 700;
    return Container(
      padding: EdgeInsets.all(isDesktop ? 28 : 18,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius:18,
            offset: const Offset(0,6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _headerText(isDesktop, isTablet),
              ),
              if(!isMobile)
                _addButton(context),
            ],
          ),
          const SizedBox(height:25),
          /// FILTER AREA
          if(isMobile)
            Column(
              children: [
                _searchField(context),
                const SizedBox(height:15),
                _statusDropdown(context),
                const SizedBox(height:15),
                SizedBox(
                  width: double.infinity,
                  child: _addButton(context),
                )
              ],
            )
          else if(isTablet)
            Column(
              children: [
                _searchField(context),
                const SizedBox(height:15),
                Row(
                  children: [
                    Expanded(
                      child: _statusDropdown(context),
                    ),
                  ],
                )
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  flex:4,
                  child: _searchField(context),
                ),
                const SizedBox(width:20),
                SizedBox(
                  width:220,
                  child: _statusDropdown(context),
                )
              ],
            )
        ],
      ),
    );
  }
  Widget _headerText(bool desktop, bool tablet,){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Seller Management",
          style: TextStyle(
            fontSize: desktop ? 30 : tablet ? 26 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height:8),
        Text(
          "Manage sellers, approvals, sales performance and account activities.",
          style: TextStyle(
            fontSize: desktop ? 15 : 13,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _searchField(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;

    return SizedBox(

      height: isMobile ? 46 : 52,


      child: TextField(


        onChanged: onSearch,


        style: TextStyle(

          fontSize:
          isMobile ? 13 : 15,

        ),



        decoration: InputDecoration(


          hintText:
          "Search sellers...",



          hintStyle: TextStyle(

            color:
            Colors.grey.shade500,

            fontSize:
            isMobile ? 13 : 14,

          ),



          prefixIcon: Icon(

            Icons.search_rounded,

            size:
            isMobile ? 20 : 23,

            color:
            Colors.grey.shade600,

          ),




          filled:true,



          fillColor:
          const Color(0xffF8F9FB),




          contentPadding:
          EdgeInsets.symmetric(

            horizontal:
            isMobile ? 12 : 18,


            vertical:
            isMobile ? 10 : 15,

          ),




          enabledBorder:
          OutlineInputBorder(

            borderRadius:
            BorderRadius.circular(14),


            borderSide:
            BorderSide(

              color:
              Colors.grey.shade200,

            ),

          ),




          focusedBorder:
          OutlineInputBorder(

            borderRadius:
            BorderRadius.circular(14),


            borderSide:
            const BorderSide(

              color:
              AppColors.primaryColor,

              width:1.5,

            ),

          ),



        ),

      ),

    );

  }

  Widget _statusDropdown(BuildContext context){


    final width =
        MediaQuery.of(context).size.width;


    final bool isMobile =
        width < 700;




    return SizedBox(


      height:
      isMobile ? 46 : 52,



      child:
      DropdownButtonFormField<String>(



        value:"All",




        icon:

        Icon(

          Icons.keyboard_arrow_down_rounded,

          color:
          Colors.grey.shade700,

        ),




        style:TextStyle(

          fontSize:
          isMobile ? 13 : 15,

          color:
          Colors.black87,

        ),




        decoration:
        InputDecoration(



          prefixIcon:

          Icon(

            Icons.filter_alt_outlined,

            size:
            isMobile ? 20 : 22,

            color:
            Colors.grey.shade600,

          ),




          filled:true,



          fillColor:
          const Color(0xffF8F9FB),





          contentPadding:
          EdgeInsets.symmetric(

            horizontal:
            isMobile ? 10 : 15,


            vertical:
            0,

          ),





          enabledBorder:
          OutlineInputBorder(

            borderRadius:
            BorderRadius.circular(14),



            borderSide:
            BorderSide(

              color:
              Colors.grey.shade200,

            ),

          ),




          focusedBorder:
          OutlineInputBorder(

            borderRadius:
            BorderRadius.circular(14),



            borderSide:
            const BorderSide(

              color:
              AppColors.primaryColor,

              width:1.5,

            ),

          ),


        ),





        items: const [


          DropdownMenuItem(

            value:"All",

            child:
            Text(
              "All Sellers",
            ),

          ),



          DropdownMenuItem(

            value:"Active",

            child:
            Text(
              "Active",
            ),

          ),



          DropdownMenuItem(

            value:"Pending",

            child:
            Text(
              "Pending",
            ),

          ),



          DropdownMenuItem(

            value:"Blocked",

            child:
            Text(
              "Blocked",
            ),

          ),



        ],





        onChanged:(value){


          onStatusChanged
              ?.call(value!);


        },


      ),


    );


  }
  Widget _addButton(BuildContext context){


    final width =
        MediaQuery.of(context).size.width;


    final bool isMobile =
        width < 700;




    return SizedBox(



      height:
      isMobile ? 46 : 52,




      child:
      ElevatedButton.icon(



        onPressed:
        onAddSeller,




        icon:

        Icon(

          Icons.person_add_alt_1_rounded,

          size:
          isMobile ? 18 : 21,

          color:
          Colors.white,

        ),





        label:

        Text(

          "Add Seller",

          style:

          TextStyle(

            color:
            Colors.white,


            fontWeight:
            FontWeight.w600,


            fontSize:
            isMobile ? 13 : 15,


          ),


        ),





        style:
        ElevatedButton.styleFrom(



          elevation:0,



          backgroundColor:
          AppColors.primaryColor,




          padding:

          EdgeInsets.symmetric(

            horizontal:

            isMobile
                ? 18
                : 26,

          ),





          shape:
          RoundedRectangleBorder(


            borderRadius:
            BorderRadius.circular(14),


          ),




        ),




      ),


    );


  }

}