import 'package:clubbers/app/api/models/event_model.dart';
import 'package:clubbers/app/shared/components/AspectRatioImage.dart';
import 'package:flutter/material.dart';

class EventBanner extends StatefulWidget {
  final Event event;

  const EventBanner({this.event});
  @override
  _EventBannerState createState() => _EventBannerState();
}

class _EventBannerState extends State<EventBanner> {
  final _transformationController = TransformationController();
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _transformationController,
      minScale: 1.0,
      maxScale: 2.0,
      onInteractionEnd: (details) {
        setState(() {
          print(_transformationController.value);
          _transformationController.toScene(Offset.zero);
        });
      },
      child: AspectRatioImage(
        ratio: 16 / 9,
        image: widget.event.banner,
      ),
    );
  }
}

/*
return InteractiveViewer(
      transformationController: _transformationController,
      minScale: 1.0,
      maxScale: 2.0,
      onInteractionEnd: (details) {
        setState(() {
          print(_transformationController.value);
          _transformationController.toScene(Offset.zero);
        });
      },
      child: AspectRatioImage(
        ratio: 16 / 9,
        image: widget.event.banner,
      ),
    );
*/
