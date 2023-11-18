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

import 'info_widget_model.dart';
export 'info_widget_model.dart';

class InfoWidgetWidget extends StatefulWidget {
  const InfoWidgetWidget({
    Key? key,
    int? width,
    int? height,
  })  : this.width = width ?? 360,
        this.height = height ?? 206,
        super(key: key);

  final int width;
  final int height;

  @override
  _InfoWidgetWidgetState createState() => _InfoWidgetWidgetState();
}

class _InfoWidgetWidgetState extends State<InfoWidgetWidget> {
  late InfoWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoWidgetModel());
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
      width: valueOrDefault<double>(
        widget.width.toDouble(),
        360.0,
      ),
      height: valueOrDefault<double>(
        widget.height.toDouble(),
        206.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFF2892F0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FlutterFlowIconButton(
                      borderColor: Color(0xFF2892F0),
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: Color(0xFF2892F0),
                      icon: Icon(
                        Icons.flight,
                        color: FlutterFlowTheme.of(context).info,
                        size: 27,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 4, 0, 0),
                  child: Text(
                    'Demand',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 24,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(85, 6, 0, 0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= 'January',
                    ),
                    options: [
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue = val),
                    width: 85,
                    height: 25,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20,
                    ),
                    fillColor: FlutterFlowTheme.of(context).info,
                    elevation: 2,
                    borderColor: Colors.transparent,
                    borderWidth: 2,
                    borderRadius: 8,
                    margin: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 4),
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          '3 tons',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Text(
                        '2 tons',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        '1 tons',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        '0',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ].divide(SizedBox(height: 5)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Container(
                      width: 370,
                      height: 90,
                      child: FlutterFlowLineChart(
                        data: [
                          FFLineChartData(
                            xData: FFAppState().xaxis,
                            yData: FFAppState().yaxis,
                            settings: LineChartBarData(
                              color: Color(0xFF2892F0),
                              barWidth: 2,
                              isCurved: true,
                              preventCurveOverShooting: true,
                              dotData: FlDotData(show: false),
                            ),
                          )
                        ],
                        chartStylingInfo: ChartStylingInfo(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          showGrid: true,
                          showBorder: false,
                        ),
                        axisBounds: AxisBounds(),
                        xAxisLabelInfo: AxisLabelInfo(),
                        yAxisLabelInfo: AxisLabelInfo(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
            child: Builder(
              builder: (context) {
                final monthlyDemand =
                    FFAppState().MonthlyDemand.toList().take(6).toList();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(monthlyDemand.length, (monthlyDemandIndex) {
                    final monthlyDemandItem = monthlyDemand[monthlyDemandIndex];
                    return Text(
                      monthlyDemandItem.maybeHandleOverflow(maxChars: 3),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
