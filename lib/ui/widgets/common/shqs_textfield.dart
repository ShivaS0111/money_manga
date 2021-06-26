import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manga/config/theme_constants.dart';

import '../../../utils/logger.dart';

/// TextField with SmartHQ Service app theme
class ShqsTextField extends StatelessWidget {

  final FocusNode? focusNode;
  final TextEditingController controller;
  final String? labelText;
  final String? errorText;
  final bool isPassword;
  final bool isServiceMode;
  final int? maxLength;
  final int maxLines;
  final VoidCallback? onClickClear;
  final List<TextInputFormatter> inputFormatter;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final Function(String)? onSubmitted;

  ShqsTextField({
    this.focusNode,
    required this.controller,
    this.labelText,
    this.errorText,
    this.isPassword = false,
    this.isServiceMode = false,
    this.maxLength,
    this.maxLines = 1,
    this.onClickClear,
    this.inputFormatter = const [],
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      focusNode: focusNode,
      cursorColor: Colors.white,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white,),
          errorText: errorText,
          errorStyle: TextStyle(color: service_button_border),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isServiceMode?service_button_border:Colors.white
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isServiceMode?service_button_border:Colors.white
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: main_button_border_disable
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isServiceMode?service_header_color:service_button_border
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isServiceMode?service_header_color:service_button_border
            ),
          ),
          suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.white, ),
              onPressed: (onClickClear == null)
                  ?controller.clear
                  :onClickClear
          )
      ),
      enableSuggestions: false,
      autocorrect: false,
      inputFormatters: inputFormatter,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
    );
  }
}

/// TextField has an Auto complete feature
class ShqsAutoCompleteTextField extends StatefulWidget {

  final TextEditingController controller;
  final String? labelText;
  final String? errorText;
  final bool isPassword;
  final bool isServiceMode;
  final int? maxLength;
  final int maxLines;
  final VoidCallback? onClickClear;
  final List<TextInputFormatter> inputFormatter;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final Function(String)? onSubmitted;
  final List<String> items;
  final int maxItemsToShow;

  ShqsAutoCompleteTextField({
    required this.controller,
    this.labelText,
    this.errorText,
    this.isPassword = false,
    this.isServiceMode = false,
    this.maxLength,
    this.maxLines = 1,
    this.onClickClear,
    this.inputFormatter = const [],
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.items = const [],
    this.maxItemsToShow = 5,
  });
  
  @override
  State<StatefulWidget> createState() => _ShqsAutoCompleteState();
}

class _ShqsAutoCompleteState extends State<ShqsAutoCompleteTextField> {

  final _focusNode = FocusNode();
  late OverlayEntry _candidatesList;
  final _layerLink = LayerLink();

  final _candidates = <String>[];

  @override
  void initState() {
    super.initState();

    widget.items.sort();
    _candidates.addAll(widget.items);

    _focusNode.addListener(() { 
      if (_focusNode.hasFocus) {
        _candidatesList = _createCandidatesList();
        Overlay.of(context)?.insert(_candidatesList);
      } else {
        _candidatesList.remove();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return CompositedTransformTarget(link: _layerLink,
      child: ShqsTextField(
        focusNode: _focusNode,
        controller: widget.controller,
        labelText: widget.labelText,
        errorText: widget.errorText,
        isPassword: widget.isPassword,
        isServiceMode: widget.isServiceMode,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        onClickClear: _onClickClear,
        inputFormatter: widget.inputFormatter,
        onChanged: _onTextChanged,
        onEditingComplete: _onEditingComplete,
        onSubmitted: _onSubmitted,
      ),
    );
  }

  void _onClickClear() {

    // TODO

    widget.onClickClear?.call();
  }

  void _onTextChanged(String data) {

    // TODO Filter auto complete candidates item list
    InviaLog.d(tag:'_onTextChanged', message: data);
    widget.onChanged?.call(data);
    _buildFilteredList();
  }

  void _onEditingComplete() {

    // TODO

    widget.onEditingComplete?.call();
    // _candidatesList.remove();
  }

  void _onSubmitted(String data) {

    // TODO

    widget.onSubmitted?.call(data);
    // _candidatesList.dispose();
  }
  
  OverlayEntry _createCandidatesList() {

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    
    return OverlayEntry(
      builder: (_) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            color: main_header_color,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: _candidates.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(_candidates[index]),
                  onTap: () {
                    // TODO Fill text field with selected value
                    InviaLog.d(tag: 'Overlay', message: 'onClick ${_candidates[index]}');
                    _onSubmitted(_candidates[index]);
                  },
                );
              },
              separatorBuilder: (_, index) {
                return Divider(
                  indent: 5.0,
                  endIndent: 5.0,
                  color: Colors.white,
                );
              },
            ),
          ),
        )
      )
    );
  }

  void _buildFilteredList() {

    final filter = widget.controller.text;

    _candidates.clear();

    for (var candidate in widget.items) {
      if (candidate.startsWith(filter)) {
        _candidates.add(candidate);
      }
    }

    setState(() {});
  }
}