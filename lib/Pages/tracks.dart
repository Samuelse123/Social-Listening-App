import '/backend/backend.dart';
import '/components/component_task_widget.dart';
import '/components/currently_listening_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'tracks_model.dart';
export 'tracks_model.dart';

class TracksWidget extends StatefulWidget {
  const TracksWidget({
    super.key,
    required this.songDocument,
  });

  final TasksRecord? songDocument;

  @override
  State<TracksWidget> createState() => _TracksWidgetState();
}

class _TracksWidgetState extends State<TracksWidget> {
  late TracksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TracksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: CurrentlyListeningWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: CurrentlyListeningWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Icon(
                Icons.music_note,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Text(
                  'People around you are listening to:',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              ListView(
                padding: EdgeInsets.fromLTRB(
                  0,
                  12,
                  0,
                  12,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.componentTaskModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ComponentTaskWidget(
                        checkAction: () async {},
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 12)),
              ),
            ].divide(SizedBox(height: 12)),
          ),
        ),
      ),
    );
  }
}
