import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/utils/toast.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_state.dart';
import 'package:graduation_project/features/orders/presentation/payment_screen.dart';
import 'package:graduation_project/features/orders/presentation/thankyou.dart';

import '../../../core/constant/components/components.dart';
import '../../../core/constant/const/const.dart';
import '../../ShoppingCar/shopping_car.dart';

class WayToPay extends StatefulWidget {
  const WayToPay({Key? key}) : super(key: key);

  @override
  _WayToPayState createState() => _WayToPayState();
}

class _WayToPayState extends State<WayToPay> {
  bool isPaymentChosen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme(
        context: context,
        isReverse: true,
        title: 'طريقة الدفع ',
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: BlocConsumer<CardCubit,ShoppingStates>(
            listener: (context, state) {

            },
           builder: (context, state) =>  Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Text(
                  'اختر طريقة الدفع : ',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
SizedBox(height: 30.h,),
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      isPaymentChosen = false;
                    });
                  },
                  child: Container(
                    height: 60.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: isPaymentChosen ? gridColor : SecondColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'الدفع عند الاستلام',
                        style: GoogleFonts.cairo(
                          color: isPaymentChosen ? Colors.black : Colors.white  ,
                        ),
                      ),
                    ),


                  ),
                ),
                SizedBox(height: 50.h,),
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      isPaymentChosen  = true;
                    });
                  },
                  child: Container(
                    height: 60.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: isPaymentChosen ? SecondColor : gridColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'الدفع من خلال البطاقة',
                        style: GoogleFonts.cairo(
                          color: isPaymentChosen ?  Colors.white : Colors.black,
                        ),
                      ),
                    ),

                  ),
                ),

               SizedBox(height: 100.h,),
                Center(
                  child: defaultButton(
                      context: context, text: 'التالي',
                      toPage: ()
                      {

if(isPaymentChosen)
{

  navigateFinish(context, WebViewApp(CardCubit.get(context).url.toString()));
} else
{

  showToast(text: 'تم انشاء الطلب بنجاح', state: ToastStates.success);

  navigateFinish(context, const ThankYou());
}
setState(() {
  cardBook = false ;
});
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}