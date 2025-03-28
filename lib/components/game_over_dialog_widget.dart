import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'game_over_dialog_model.dart';
export 'game_over_dialog_model.dart';

class GameOverDialogWidget extends StatefulWidget {
  const GameOverDialogWidget({
    super.key,
    required this.score,
    required this.highScore,
    required this.onButtonTap,
    bool? isScoreHighest,
  }) : this.isScoreHighest = isScoreHighest ?? false;

  final int? score;
  final int? highScore;
  final Future Function()? onButtonTap;
  final bool isScoreHighest;

  @override
  State<GameOverDialogWidget> createState() => _GameOverDialogWidgetState();
}

class _GameOverDialogWidgetState extends State<GameOverDialogWidget>
    with TickerProviderStateMixin {
  late GameOverDialogModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameOverDialogModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GAME',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Press Start 2P',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/dino.png',
                    width: 140.0,
                    height: 140.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'OVER',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Press Start 2P',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            if (widget.isScoreHighest)
              Text(
                'New High Score!!',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Press Start 2P',
                      color: Color(0xFFD239D2),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Score: \n',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'IM Fell Great Primer SC',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.score?.toString(),
                          '0',
                        ),
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'IM Fell Great Primer SC',
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'High Score: \n',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'IM Fell Great Primer SC',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.highScore?.toString(),
                          '0',
                        ),
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'IM Fell Great Primer SC',
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.onButtonTap?.call();
                },
                text: 'PLAY AGAIN',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryText,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Press Start 2P',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
