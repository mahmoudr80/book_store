import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const governorates = [
  "Cairo",
  "Giza",
  "Alexandria",
  "Dakahlia",
  "Red Sea",
  "Beheira",
  "Fayoum",
  "Gharbia",
  "Ismailia",
  "Menofia",
  "Minya",
  "Qalyubia",
  "New Valley",
  "Suez",
  "Aswan",
  "Assiut",
  "Beni Suef",
  "Port Said",
  "Damietta",
  "Sharkia",
  "South Sinai",
  "Kafr El Sheikh",
  "Matrouh",
  "Luxor",
  "Qena",
  "North Sinai",
  "Sohag"
];

Future<int> governorateDialog(BuildContext context) async {
 int ?currentIndex= await showDialog<int?>(context: context,
   builder: (context) {
    return AlertDialog(
      title: Text("Select Governoarate",style: AppTextStyle.labelStyle,),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(itemBuilder:(context, index) =>
            TextButton(onPressed: (){
              Navigator.pop(context,index);
            },
                child: Text(governorates[index],style: AppTextStyle.hintStyle,)),
            shrinkWrap: true,separatorBuilder: (context, index) => SizedBox(height: 10.h,
          child: Divider(),),
            itemCount: governorates.length)),
      );


  },);
  return currentIndex??0;
}