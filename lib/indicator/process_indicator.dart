import 'package:flutter/cupertino.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class ProcessIndicator extends StatelessWidget{
  final List<bool> isSelectIndicator;
  double top;
  ProcessIndicator({this.isSelectIndicator, this.top = 24});

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
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.0, 0.17, 0.47, 0.69, 1.0],
                    colors: [
                      Color(hexStringToHexInt('#F89825')),
                      Color(hexStringToHexInt('#F26322')),
                      Color(hexStringToHexInt('#E5333B')),
                      Color(hexStringToHexInt('#C81D5E')),
                      Color(hexStringToHexInt('#A91E5E')),
                    ],
                  ),
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
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.17, 0.47, 0.69, 1.0],
                  colors: [
                    Color(hexStringToHexInt('#F89825')),
                    Color(hexStringToHexInt('#F26322')),
                    Color(hexStringToHexInt('#E5333B')),
                    Color(hexStringToHexInt('#C81D5E')),
                    Color(hexStringToHexInt('#A91E5E')),
                  ],
                ),
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