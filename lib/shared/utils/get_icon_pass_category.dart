import 'package:flutter/material.dart';

IconData getIconPassCategory(String type) => switch (type) {
      'sites' => Icons.public_rounded,
      'socialNetworks' => Icons.groups_rounded,
      'applications' => Icons.apps,
      'devices' => Icons.devices,
      'networks' => Icons.network_wifi,
      'files' => Icons.folder,
      'others' => Icons.category_rounded,
      _ => Icons.category_rounded,
    };
