import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'info_widget_mobile_model.dart';
export 'info_widget_mobile_model.dart';

class InfoWidgetMobileWidget extends StatefulWidget {
  const InfoWidgetMobileWidget({Key? key}) : super(key: key);

  @override
  _InfoWidgetMobileWidgetState createState() => _InfoWidgetMobileWidgetState();
}

class _InfoWidgetMobileWidgetState extends State<InfoWidgetMobileWidget> {
  late InfoWidgetMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoWidgetMobileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 180,
      height: 94,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 1,
                        borderWidth: 0,
                        buttonSize: 20,
                        fillColor: Color(0xFF2892F0),
                        icon: Icon(
                          Icons.flight,
                          color: Colors.white,
                          size: 12,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 2, 0, 0),
                  child: Text(
                    'Demand',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60, 3, 0, 0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= '2023',
                    ),
                    options: ['2023'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue = val),
                    width: 25,
                    height: 20,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                        ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 7,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2,
                    borderColor: Colors.transparent,
                    borderWidth: 0,
                    borderRadius: 2,
                    margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '3tons',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 9,
                            ),
                      ),
                      Text(
                        '2tons',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 9,
                            ),
                      ),
                      Text(
                        '1ton',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 9,
                            ),
                      ),
                      Text(
                        '0',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 9,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: Container(
                    width: 140,
                    height: 40,
                    child: FlutterFlowLineChart(
                      data: [
                        FFLineChartData(
                          xData: FFAppState().xaxis,
                          yData: FFAppState().yaxis,
                          settings: LineChartBarData(
                            color: Color(0xFF2892F0),
                            barWidth: 1,
                            isCurved: true,
                            dotData: FlDotData(show: false),
                          ),
                        )
                      ],
                      chartStylingInfo: ChartStylingInfo(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        showBorder: false,
                      ),
                      axisBounds: AxisBounds(),
                      xAxisLabelInfo: AxisLabelInfo(),
                      yAxisLabelInfo: AxisLabelInfo(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 3, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                  child: Text(
                    'Jan',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 9,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                  child: Text(
                    'Feb',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 9,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                  child: Text(
                    'Mar',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 9,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                  child: Text(
                    'Apr',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 9,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                  child: Text(
                    'May',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 9,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                  child: Text(
                    'Jun',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 9,
                        ),
                  ),
                ),
              ].divide(SizedBox(width: 5)),
            ),
          ),
        ],
      ),
    );
  }
}
