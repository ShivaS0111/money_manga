
import 'package:flutter/material.dart';

const image_path = 'assets/images/';
const logo_path = image_path+'logo.png';

const icon_path = '${image_path}icons/';

/// SmartHQ Service common icon images
///
/// ```dart
/// // example
/// Image(image: ShqsIcons.fridge,);
/// ```
class ShqsIcons {

  static final _folder = '${icon_path}ic_folder.png';
  static final _history = '${icon_path}ic_history.png';
  static final _info = '${icon_path}ic_info.png';
  static final _literature = '${icon_path}ic_literature.png';
  static final _loads = '${icon_path}ic_loads.png';
  static final _operate = '${icon_path}ic_operate.png';
  static final _partsFinder = '${icon_path}ic_parts_finder.png';
  static final _photos = '${icon_path}ic_photos.png';
  static final _search = '${icon_path}ic_search.png';
  static final _tests = '${icon_path}ic_tests.png';
  static final _dishwasher = '${icon_path}ic_dishwasher.png';
  static final _zoneLine = '${icon_path}ic_zoneline.png';
  static final _dryer = '${icon_path}ic_dryer.png';
  static final _fridge = '${icon_path}ic_fridge.png';
  static final _question = '${icon_path}ic_question.png';
  static final _range = '${icon_path}ic_range.png';
  static final _washer = '${icon_path}ic_washer.png';
  static final _waterHeater = '${icon_path}ic_water_heater.png';

  static ImageProvider get folder => AssetImage(_folder);
  static ImageProvider get history => AssetImage(_history);
  static ImageProvider get info => AssetImage(_info);
  static ImageProvider get literature => AssetImage(_literature);
  static ImageProvider get loads => AssetImage(_loads);
  static ImageProvider get operate => AssetImage(_operate);
  static ImageProvider get partsFinder => AssetImage(_partsFinder);
  static ImageProvider get photos => AssetImage(_photos);
  static ImageProvider get search => AssetImage(_search);
  static ImageProvider get tests => AssetImage(_tests);
  static ImageProvider get dishwasher => AssetImage(_dishwasher);
  static ImageProvider get zoneLine => AssetImage(_zoneLine);
  static ImageProvider get dryer => AssetImage(_dryer);
  static ImageProvider get fridge => AssetImage(_fridge);
  static ImageProvider get question => AssetImage(_question);
  static ImageProvider get range => AssetImage(_range);
  static ImageProvider get washer => AssetImage(_washer);
  static ImageProvider get waterHeater => AssetImage(_waterHeater);
}