import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class ProcessIndicator extends StatelessWidget{
  final List<bool> isSelectIndicator;
  double top;
  ProcessIndicator({this.isSelectIndicator, this.top = 59});

  @override
  Widget build(BuildContext context) {

    List<Widget> indicator = [];

    for(int i = 0; i < isSelectIndicator.length; i++){

      if(i > 0){
        if(isSelectIndicator[i]){
          indicator.add(
            Expanded(
              child: Container(
                height: ScreenUtil().setHeight(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setHeight(50)),
                  color: Color(hexStringToHexInt('#BB2034')),
                ),
              ),
            ),
          );
        }else{
          indicator.add(
            Expanded(
              child: Container(
                height: ScreenUtil().setHeight(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setHeight(50)),
                  color: Color(hexStringToHexInt('#DEE2E6')),
                ),
              ),
            ),
          );
        }
      }
      if(isSelectIndicator[i]){
        indicator.add(
            Container(
              height: ScreenUtil().setHeight(32),
              width: ScreenUtil().setHeight(32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setHeight(50)),
                  color: Color(hexStringToHexInt('#BB2034'))
              ),
              child: Center(
                child: Text(
                  '${i + 1}',
                  textAlign: TextAlign.center,
                  style: getCustomFont(Color(hexStringToHexInt('#F1F3F5')), 24, 'Roboto-Regular'),
                ),
              ),
            )
        );
      }else{
        indicator.add(
          Container(
            height: ScreenUtil().setHeight(24),
            width: ScreenUtil().setHeight(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setHeight(50)),
                color: Color(hexStringToHexInt('#DEE2E6'))
            ),
            child: Center(
              child: Text(
                '${i + 1}',
                textAlign: TextAlign.center,
                style: getCustomFont(Color(hexStringToHexInt('#495057')), 16, 'Roboto-Regular'),
              ),
            ),
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(top),
        left: ScreenUtil().setWidth(76),
        right: ScreenUtil().setWidth(76),
      ),
      child: Hero(
        tag: 'indicator',
        child: Container(
          height: ScreenUtil().setHeight(34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicator,
          ),
        ),
      ),
    );
  }

}