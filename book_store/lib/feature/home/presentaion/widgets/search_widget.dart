
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';
class SearchWidget extends StatefulWidget  {
  const SearchWidget({super.key, this.onSearch, required this.hintText});
  final Function(String)? onSearch;
  final String hintText;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();
  @override
  void initState() {
    _searchSubject.stream.debounceTime((Duration(milliseconds: 500))).
    listen((event) {
      if(event.trim().isEmpty)
        {return;}
      widget.onSearch?.call(event);
    },);
    super.initState();
  }

  void _onChanged(String value) {
    _searchSubject.add(value);
  }

  void _onSubmit(String value) {
    if (value.trim().isEmpty) return;

    widget.onSearch?.call(value);
  }
  @override
  void dispose() {
    _searchSubject.close();
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _controller,
      hintText: widget.hintText,
      hintStyle: AppTextStyle.hintSearchStyle,
      prefixIcon: Icon(Icons.search_outlined,size: 25.r,),
      onChanged: _onChanged,
      searchTapped: _onSubmit,
      keyboardType: TextInputType.text,
    );
  }
}
