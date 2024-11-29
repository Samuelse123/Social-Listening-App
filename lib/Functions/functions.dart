import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? newCustomFunction(
  double lon1,
  double lat1,
  double lon2,
  double lat2,
) {
  const double earthRadius = 6371; // in kilometers

  // Convert degrees to radians directly
  double dLat = (lat2 - lat1) * math.pi / 180;
  double dLon = (lon2 - lon1) * math.pi / 180;

  // Convert latitudes to radians
  double radLat1 = lat1 * math.pi / 180;
  double radLat2 = lat2 * math.pi / 180;

  // Haversine formula
  double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(radLat1) * math.cos(radLat2) * math.pow(math.sin(dLon / 2), 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distance = earthRadius * c;

  String distanceString = distance.toString();
  return distanceString;
}
