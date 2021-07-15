
import 'package:flutter/material.dart';
import 'package:money_manga/ui/widgets/common/shqs_buttons.dart';
import 'package:money_manga/ui/widgets/common/shqs_textfield.dart';


class ModelNumberInputPage extends StatefulWidget {

  static final name = '/model_number_input';

  @override
  State<StatefulWidget> createState() => _ModelNumberInputState();
}

class _ModelNumberInputState extends State<ModelNumberInputPage> {

  final _modelNumberController = TextEditingController();
  final _serialNumberController = TextEditingController();

  bool _isValidModelNumber = true;
  bool _isValidSerialNumber = true;

  @override
  void initState() {
    super.initState();

    // TODO Load Model numbers. Need to create XML loading screen?
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Input Model Number'),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ShqsCommonButton(
                text: 'Next',
                isEnable: true,
                onTap: () {
                  setState(() {
                    _isValidModelNumber = _checkModelNumberValidation();
                    _isValidSerialNumber = _checkSerialNumberValidation();
                  });

                  if (_isValidSerialNumber && _isValidSerialNumber) {
                  }
                }),
          )

        ],
        titleSpacing: 10.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ShqsAutoCompleteTextField(
              controller: _modelNumberController,
              labelText: 'Model Number',
              errorText: _isValidModelNumber?null:'Invalid model number',
              onClickClear: () {
                _modelNumberController.clear();
                _serialNumberController.clear();
              },
              items: [
                'ABCDEF',
                'ACDEFG',
                'BCDEFG',
                'BDEFGH',
                'CDEFGH',
              ],
              onChanged: (modelNumber) {
                // TODO change filter
              },
              onEditingComplete: () {
                // TODO change focus
                FocusScope.of(context).unfocus();
              },
              onSubmitted: (modelNumber) {
                _modelNumberController.text = modelNumber;
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ShqsTextField(
              controller: _serialNumberController,
              maxLength: 8,
              labelText: 'Serial Number',
              errorText: _isValidSerialNumber?null:'Invalid serial number',
              onClickClear: () {
                _serialNumberController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _checkModelNumberValidation() {
    // TODO Not implemented
    return true;
  }

  bool _checkSerialNumberValidation() => RegExp(r'[a-zA-Z]{2}[0-9]{6}')
      .stringMatch(_serialNumberController.text) != null;
}