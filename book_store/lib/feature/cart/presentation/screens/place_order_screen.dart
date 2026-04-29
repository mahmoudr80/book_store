import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/feature/cart/presentation/widget/user_form.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_button.dart';
import '../widget/price_widget.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
   TextEditingController? nameController;
   TextEditingController ?emailController;
   TextEditingController ?addressController;
   TextEditingController ?phoneController;
   TextEditingController ?governorateController;
   GlobalKey<FormState>?formKey;

  @override
  void initState() {
    nameController=TextEditingController();
    emailController=TextEditingController();
    addressController=TextEditingController();
    phoneController=TextEditingController();
    governorateController=TextEditingController();
    formKey=GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: CustomBackButton(tapped: () => Navigator.pop(context),),
        ),
        leadingWidth: 70.w,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.h,bottom: 25.h,top: 21.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(LocaleKeys.place_your_order.tr(),style: AppTextStyle.headlineStyle,),
            Text(LocaleKeys.place_order_description.tr(),
              style: AppTextStyle.hintStyle,),
              SizedBox(height: 15.h,),
              UserForm(nameController: nameController, emailController: emailController,
                  addressController: addressController, phoneController: phoneController,
                  governorateController: governorateController, formKey: formKey),
              Column(
                spacing: 19.h,
                children: [
                  PriceWidget(),
                   AppButton(label: LocaleKeys.submit_order.tr(),tapped: () {
                    if(formKey?.currentState?.validate()??false){
                      Navigator.pushNamed(context,RoutesScreens.congratsScreen);
                    }else
                     {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LocaleKeys.form_data_incorrect.tr(),style: TextStyle(color: Colors.white),)
                      ,backgroundColor: Colors.redAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100.r)),),
                      );
                    }
                    
                  },)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
