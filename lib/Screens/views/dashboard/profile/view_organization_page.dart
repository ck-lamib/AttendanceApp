import 'package:attendance_bloc/utils/helpers/image_path.dart';

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../widgets/custom/custom_app_bar.dart';
import '../../../widgets/organization_detail_card.dart';
import '../../../widgets/parent_screen.dart';

class ViewOrganizationDetailPage extends StatefulWidget {
  static const String routeName = "/view-organization-detail-page";
  const ViewOrganizationDetailPage({super.key});

  @override
  State<ViewOrganizationDetailPage> createState() => _ViewOrganizationDetailPageState();
}

class _ViewOrganizationDetailPageState extends State<ViewOrganizationDetailPage> {
  ExpansionTileController imageExpansionTileController = ExpansionTileController();
  ExpansionTileController aboutExpansionTileController = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ParentScreen(
          appBar: const CustomAppBar(
            title: "View Organization Detail",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                shrinkWrap: true,
                children: [
                  OrganizationDetailCard(
                      title: "About Organization",
                      widget: Text(
                        "Aarambha IT is an Information Communication Technology and Business Management company. We design, develop, support and promote our own ICT and business management application software using the latest technology currently available in the market and also some other domains through our alliances' coordination.",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColor.main,
                            ),
                      ),
                      expansionTileController: aboutExpansionTileController,
                      onExpansionChanged: (isExpanded) {
                        if (isExpanded) {
                          try {
                            if (imageExpansionTileController.isExpanded) {
                              imageExpansionTileController.collapse();
                            }
                          } catch (_) {}
                        }
                      }),
                  OrganizationDetailCard(
                      title: "Organization Logo/Banner",
                      widget: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            ImagePath.bannerImagePath,
                          )),
                      expansionTileController: imageExpansionTileController,
                      onExpansionChanged: (isExpanded) {
                        if (isExpanded) {
                          try {
                            if (aboutExpansionTileController.isExpanded) {
                              aboutExpansionTileController.collapse();
                            }
                          } catch (_) {}
                        }
                      })
                ],
              ),
            ),
          )),
    );
  }
}
