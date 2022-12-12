import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/features/profile/profile_vm.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:aoba/widgets/tint/tint.dart';
import 'package:aoba/widgets/wave/wave.dart';
import 'package:flutter/material.dart';
import 'package:scroll_builder/scroll_builder.dart';

import 'package:veee/veee.dart';

import 'info_box.dart';

class ProfileAppBar extends ViewModelWidget<ProfileViewModel> {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel vm) {
    final colors = context.colors;
    final size = context.media.size;
    final expandedHeight = size.width / AspectRatios.profileBanner;
    return SliverAppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      expandedHeight: expandedHeight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar.createSettings(
        currentExtent: 1,
        child: ScrollBuilder(
          scrollController: vm.scrollController,
          breakpoint: expandedHeight - 16,
          delegate: ScrollBuilderCustomDelegate(
            builder: (percentage, child) {
              final backgroundCurve = Curves.easeIn.transform(percentage);
              final infoCurve = const Interval(0, 0.7).transform(percentage);
              return FlexibleSpaceBar(
                background: Tint(
                  color: colors.surfaceTone2.withOpacity(backgroundCurve),
                  child: NetworkImageWithPlaceholder(
                    type: ImageType.banner,
                    url: vm.info.data?.bannerImage,
                    color: colors.surfaceTone1,
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                titlePadding: EdgeInsets.zero,
                title: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Wave(
                      height: 12 * (1 - backgroundCurve),
                      wavelength: 28 * 2,
                      color: colors.background,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 0,
                        bottom:
                            Tween(begin: 24.0, end: 0.0).transform(infoCurve),
                      ),
                      child: InfoBox(
                        scrollProgress: infoCurve,
                        avatarUrl: vm.info.data?.avatar?.large,
                        name: vm.info.data?.name,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
