import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class Device {
  final DeviceInfo info;
  final bool isFrameVisible;
  final Orientation orientation;

  const Device({
    required this.info,
    this.isFrameVisible = false,
    this.orientation = Orientation.portrait,
  });
}

class Preview extends StatelessWidget {
  final WidgetBuilder builder;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Device? device;

  const Preview({
    Key? key,
    required this.builder,
    this.width,
    this.height,
    this.constraints,
    this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = this.device;
    var wrappedChild = device == null
        ? builder(context)
        : DeviceFrame(
            device: device.info,
            screen: builder(context),
            isFrameVisible: device.isFrameVisible,
            orientation: device.orientation,
          );

    return Container(
      height: height,
      width: width,
      constraints: constraints,
      child: wrappedChild,
    );
  }
}
