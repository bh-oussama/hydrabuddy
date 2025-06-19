library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hydra_buddy/enum/weight_unit.dart';
import 'package:hydra_buddy/extensions/context.dart';
import 'package:hydra_buddy/models/user.dart';
import 'package:hydra_buddy/utils/convert.dart';

import '../../UI/utils.dart';
import '../../enum/female_status.dart';
import '../../enum/gender.dart';
import '../../enum/physical_activity_level.dart';
import '../../generated/l10n.dart';
import '../../providers/current_user.dart';
import '../../providers/location.dart';

part 'get_started.dart';
part 'location.dart';
part 'name_input.dart';
part 'personal_info.dart';
part 'physical_activity.dart';
part 'ready.dart';

enum OnboardingPage {
  getStarted,
  nameInput,
  personalInfo,
  physicalActivity,
  location,
  ready;

  String get fullPath {
    switch (this) {
      case OnboardingPage.getStarted:
        return '/onboarding';
      case OnboardingPage.nameInput:
        return '/onboarding/name';
      case OnboardingPage.personalInfo:
        return '/onboarding/personal-info';
      case OnboardingPage.physicalActivity:
        return '/onboarding/physical-activity';
      case OnboardingPage.location:
        return '/onboarding/location';
      case OnboardingPage.ready:
        return '/onboarding/ready';
    }
  }

  String get name {
    return fullPath;
  }
}
