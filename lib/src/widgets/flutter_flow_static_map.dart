import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/src/utils/lat_lng.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;

/// A widget that displays a static map using the Mapbox API.
class FlutterFlowStaticMap extends StatelessWidget {
  const FlutterFlowStaticMap({
    required this.location,
    required this.apiKey,
    required this.style,
    required this.width,
    required this.height,
    super.key,
    this.fit,
    this.borderRadius = BorderRadius.zero,
    this.markerColor,
    this.markerUrl,
    this.cached = false,
    this.zoom = 12,
    this.tilt = 0,
    this.rotation = 0,
  });

  /// The location to display on the map.
  final LatLng location;

  /// The API key for accessing the Mapbox API.
  final String apiKey;

  /// The style of the map.
  final mapbox.MapBoxStyle style;

  /// The width of the map widget.
  final double width;

  /// The height of the map widget.
  final double height;

  /// How the map should be inscribed into the available space.
  final BoxFit? fit;

  /// The border radius of the map widget.
  final BorderRadius borderRadius;

  /// The color of the marker on the map.
  final Color? markerColor;

  /// The URL of the custom marker icon.
  final String? markerUrl;

  /// Whether to cache the map image.
  final bool cached;

  /// The zoom level of the map.
  final int zoom;

  /// The tilt angle of the map camera.
  final int tilt;

  /// The rotation angle of the map camera.
  final int rotation;

  @override
  Widget build(final BuildContext context) {
    final imageWidth = width.clamp(1, 1280).toInt();
    final imageHeight = height.clamp(1, 1280).toInt();
    final imagePath = getStaticMapImageURL(
      location,
      apiKey,
      style,
      imageWidth,
      imageHeight,
      markerColor,
      markerUrl,
      zoom,
      rotation,
      tilt,
    );
    return ClipRRect(
      borderRadius: borderRadius,
      child: cached
          ? CachedNetworkImage(
              imageUrl: imagePath,
              width: width,
              height: height,
              fit: fit,
            )
          : Image.network(
              imagePath,
              width: width,
              height: height,
              fit: fit,
            ),
    );
  }
}

String getStaticMapImageURL(
  final LatLng location,
  final String apiKey,
  final mapbox.MapBoxStyle mapStyle,
  final int width,
  final int height,
  final Color? markerColor,
  final String? markerURL,
  final int zoom,
  final int rotation,
  final int tilt,
) {
  final finalLocation = (
    lat: location.latitude.clamp(-90, 90).toDouble(),
    long: location.longitude.clamp(-180, 180).toDouble(),
  );
  final finalRotation = rotation.clamp(-180, 180);
  final finalTilt = tilt.clamp(0, 60);
  final finalZoom = zoom.clamp(0, 22);
  final image = mapbox.StaticImage(apiKey: apiKey);
  if (markerColor == null && (markerURL == null || markerURL.trim().isEmpty)) {
    return image
        .getStaticUrlWithoutMarker(
          center: finalLocation,
          style: mapStyle,
          width: width,
          height: height,
          zoomLevel: finalZoom,
          bearing: finalRotation,
          pitch: finalTilt,
        )
        .toString();
  } else {
    return image
        .getStaticUrlWithMarker(
          marker: markerURL == null || markerURL.trim().isEmpty
              ? mapbox.MapBoxMarker(
                  markerColor: mapbox.RgbColor(
                    markerColor!.red,
                    markerColor.green,
                    markerColor.blue,
                  ),
                  markerLetter: mapbox.MakiIcons.circle.value,
                  markerSize: mapbox.MarkerSize.MEDIUM,
                )
              : null,
          markerUrl: markerURL,
          center: finalLocation,
          style: mapStyle,
          width: width,
          height: height,
          zoomLevel: finalZoom,
          bearing: finalRotation,
          pitch: finalTilt,
        )
        .toString();
  }
}
