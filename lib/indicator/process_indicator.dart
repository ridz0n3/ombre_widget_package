import 'package:flutter/cupertino.dart';
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
                height: setHeight(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(setHeight(50)),
                  color: Color(hexStringToHexInt('#E5333B')),
                ),
              ),
            ),
          );
        }else{
          indicator.add(
            Expanded(
              child: Container(
                height: setHeight(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(setHeight(50)),
                  color: Color(hexStringToHexInt('#4DFFFCF2')),
                ),
              ),
            ),
          );
        }
      }

      if(isSelectIndicator[i]){
        indicator.add(
            Container(
              height: setHeight(26),
              width: setHeight(26),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(setHeight(50)),
                  color: Color(hexStringToHexInt('#E5333B'))
              ),
              child: Center(
                child: Text(
                  '${i + 1}',
                  textAlign: TextAlign.center,
                  style: getCustomFont(Color(hexStringToHexInt('#F1F3F5')), 11, 'Poppins-Regular'),
                ),
              ),
            )
        );
      }
      else{
        indicator.add(
          Container(
            height: setHeight(20),
            width: setHeight(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(setHeight(50)),
                color: Color(hexStringToHexInt('#4DFFFCF2'))
            ),
            child: Center(
              child: Text(
                '${i + 1}',
                textAlign: TextAlign.center,
                style: getCustomFont(Color(hexStringToHexInt('#F1F3F5')), 11, 'Poppins-Regular'),
              ),
            ),
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        top: setHeight(top),
        left: setWidth(76),
        right: setWidth(76),
      ),
      child: Hero(
        tag: 'indicator',
        child: Container(
          height: setHeight(34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicator,
          ),
        ),
      ),
    );
  }

}