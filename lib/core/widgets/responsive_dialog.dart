import 'package:flutter/material.dart';


class ResponsiveDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;

  const ResponsiveDialog({
    super.key,
    required this.title,
    required this.child,
    this.actions,
  });

  double _dialogWidth(BuildContext context){

    final width = MediaQuery.of(context).size.width;
    if(width >=1100){
      return 500;
    }
    else if(width >=700){
      return 430;
    }
    else{
      return width * 0.90;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width <700;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40, vertical:24,),
      child:Container(
        width: _dialogWidth(context),
        padding: EdgeInsets.all(isMobile ? 16 : 24,),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Text(
              title,
              style:TextStyle(
                fontSize: isMobile ? 18 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height:20),
            Flexible(
              child: SingleChildScrollView(child:child,),
            ),

            if(actions != null)...[
              const SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:actions!,
              )
            ]
          ],
        ),
      ),
    );
  }
}