import '/backend/backend.dart';
import '../../map_settings/map_settings_google_map.dart';
import '../../map_settings/map_settings_theme.dart';
import '../../map_settings/map_settings_util.dart';
import '../../map_settings/map_settings_widgets.dart';
import '/pages/modal11_create_note/modal11_create_note_widget.dart';
import 'googlemaps_widget.dart' show GooglemapsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GooglemapsModel extends FlutterFlowModel<GooglemapsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
