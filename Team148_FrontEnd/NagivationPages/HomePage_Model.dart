import '/backend/backend.dart';
import '/components/bar_widget_mobile_widget.dart';
import '/components/info_widget_mobile_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<FlightRecord> simpleSearchResults = [];
  // Model for bar_widget_mobile component.
  late BarWidgetMobileModel barWidgetMobileModel;
  // Model for Info_widget_mobile component.
  late InfoWidgetMobileModel infoWidgetMobileModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    barWidgetMobileModel = createModel(context, () => BarWidgetMobileModel());
    infoWidgetMobileModel = createModel(context, () => InfoWidgetMobileModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    barWidgetMobileModel.dispose();
    infoWidgetMobileModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
