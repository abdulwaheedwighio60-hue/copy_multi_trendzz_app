import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class SellerSearchFilterWidget extends StatefulWidget {
  final Function(String)? onSearchChanged;
  final Function(String)? onStatusChanged;
  final Function(String)? onStoreChanged;
  final VoidCallback? onAddSeller;
  const SellerSearchFilterWidget({
    super.key,
    this.onSearchChanged,
    this.onStatusChanged,
    this.onStoreChanged,
    this.onAddSeller,
  });

  @override
  State<SellerSearchFilterWidget> createState() => _SellerSearchFilterWidgetState();
}


class _SellerSearchFilterWidgetState extends State<SellerSearchFilterWidget> {

  String selectedStatus = "All";
  String selectedStore = "All";

   List<String> statusList = [
    "All",
    "Active",
    "Pending",
    "Blocked",
  ];
  final List<String> storeList = [
    "All",
    "Fashion",
    "Electronics",
    "Beauty",
    "Grocery",
  ];
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width >= 1100;
    final bool isTablet = width >=700 && width <1100;
    final bool isMobile = width <700;
    return Container(
      padding: EdgeInsets.all(
        isMobile ? 16 : 22,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius:15,
            offset: const Offset(0,5),
          )
        ],
      ),
      child:
      /// MOBILE
      isMobile ? Column(
        children: [
          _searchField(context),
          const SizedBox(height:15),
          _statusDropdown(),
          const SizedBox(height:15),
          _storeDropdown(),
          const SizedBox(height:15),

          SizedBox(
            width: double.infinity,
            child: _addButton(),
          )
        ],
      )

      /// TABLET
          : isTablet ? Column(
        children: [
          _searchField(context),

          const SizedBox(height:15),
          Row(

            children: [
              Expanded(

                child:
                _statusDropdown(),
              ),
              const SizedBox(width:15),
              Expanded(
                child: _storeDropdown(),
              ),
            ],
          ),
          const SizedBox(height:15),

          Align(
            alignment: Alignment.centerRight,
            child: _addButton(),
          )
        ],
      )
      /// DESKTOP

          :
      Row(
        children: [
          Expanded(
            flex:4,
            child:
            _searchField(context),
          ),
          const SizedBox(width:18),
          Expanded(
            child: _statusDropdown(),),
          const SizedBox(width:18),
          Expanded(child: _storeDropdown(),),
          const SizedBox(width:18),
          _addButton(),
        ],
      ),
    );

  }

  Widget _searchField(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    return SizedBox(
      height: isMobile ? 46 : 52,
      child: TextField(
        // onChanged: onSearch,
        style: TextStyle(
          fontSize:
          isMobile ? 13 : 15,
        ),
        decoration: InputDecoration(
          hintText: "Search sellers...",
          hintStyle: TextStyle(

            color: Colors.grey.shade500,
            fontSize: isMobile ? 13 : 14,
          ),
          prefixIcon: Icon(Icons.search_rounded,
            size: isMobile ? 20 : 23,
            color: Colors.grey.shade600,
          ),

          filled:true,
          fillColor: const Color(0xffF8F9FB),
          contentPadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 18,
            vertical: isMobile ? 10 : 15,

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width:1.5,
            ),
          ),

        ),
      ),
    );
  }


  Widget _statusDropdown(){

    return _dropdown(

      context: context,

      value:selectedStatus,

      label:"Status",

      items:statusList,


      onChanged:(value){

        setState((){

          selectedStatus=value;

        });


        widget.onStatusChanged
            ?.call(value);


      },


    );

  }
  Widget _storeDropdown(){

    return _dropdown(

      context: context,

      value:selectedStore,

      label:"Store",

      items:storeList,


      onChanged:(value){


        setState((){

          selectedStore=value;

        });



        widget.onStoreChanged
            ?.call(value);


      },


    );

  }


  Widget _dropdown({
    required BuildContext context,
    required String value,
    required String label,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    final width =
        MediaQuery.of(context).size.width;
    final bool isMobile =
        width < 700;
    final bool isTablet =
        width >= 700 && width < 1100;
    return SizedBox(


      height:
      isMobile
          ? 46
          : isTablet
          ? 50
          : 52,



      child:

      DropdownButtonFormField<String>(



        value:value,



        icon:

        Icon(

          Icons.keyboard_arrow_down_rounded,

          size:
          isMobile ? 20 : 24,

          color:
          Colors.grey.shade700,

        ),





        style:

        TextStyle(

          fontSize:

          isMobile
              ? 13
              : isTablet
              ? 14
              : 15,


          color:
          Colors.black87,


        ),






        decoration:

        InputDecoration(



          labelText:

          label,




          labelStyle:

          TextStyle(

            fontSize:

            isMobile ? 12 : 14,

            color: Colors.grey.shade600,
          ),

          prefixIcon: Icon(
            label == "Status"
                ? Icons.filter_alt_outlined
                : Icons.store_outlined,
            size: isMobile ? 19 : 22,
            color: Colors.grey.shade600,
          ),
          filled:true,fillColor:
          const Color(0xffF8F9FB),
          contentPadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : isTablet ? 12 : 16,
            vertical:0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width:1.5,
            ),
          ),
        ),
        items: items.map((item){
          return DropdownMenuItem<String>(
            value:item,
            child: Text(
              item,
              style: TextStyle(fontSize: isMobile ? 13 : 14,
              ),
            ),
          );
        }).toList(),

        onChanged:(value){
          if(value != null){
            onChanged(value);
          }},
      ),
    );
  }








  Widget _addButton() {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return SizedBox(
      width: isMobile ? double.infinity : null,
      height: isMobile ? 46 : isTablet ? 50 : 52,

      child: ElevatedButton.icon(
        onPressed: widget.onAddSeller,

        icon: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
          size: isMobile ? 18 : 20,
        ),

        label: Text(
          "Add Seller",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: isMobile
                ? 13
                : isTablet
                ? 14
                : 15,
          ),
        ),

        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,

          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? 16
                : isTablet
                ? 20
                : 26,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),

          shadowColor: Colors.black.withOpacity(.15),

          minimumSize: Size(
            isMobile ? double.infinity : 170,
            isMobile ? 46 : isTablet ? 50 : 52,
          ),
        ),
      ),
    );
  }


}