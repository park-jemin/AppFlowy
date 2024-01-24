import 'package:appflowy/mobile/presentation/bottom_sheet/show_mobile_bottom_sheet.dart';
import 'package:appflowy/mobile/presentation/database/date_picker/mobile_date_picker_screen.dart';
import 'package:appflowy/plugins/database/widgets/cell/editable_cell_skeleton/date.dart';
import 'package:appflowy/plugins/database/widgets/row/cells/cell_container.dart';
import 'package:appflowy/plugins/database/widgets/row/cells/date_cell/date_cell_bloc.dart';
import 'package:appflowy_popover/appflowy_popover.dart';
import 'package:flowy_infra_ui/flowy_infra_ui.dart';
import 'package:flutter/material.dart';

class MobileGridDateCellSkin extends IEditableDateCellSkin {
  @override
  Widget build(
    BuildContext context,
    CellContainerNotifier cellContainerNotifier,
    DateCellBloc bloc,
    DateCellState state,
    PopoverController popoverController,
  ) {
    return FlowyButton(
      radius: BorderRadius.zero,
      hoverColor: Colors.transparent,
      margin: EdgeInsets.zero,
      text: Align(
        alignment: AlignmentDirectional.centerStart,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: FlowyText(
            state.dateStr,
            fontSize: 15,
          ),
        ),
      ),
      onTap: () {
        showMobileBottomSheet(
          context,
          padding: EdgeInsets.zero,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          builder: (context) {
            return MobileDateCellEditScreen(
              controller: bloc.cellController,
              showAsFullScreen: false,
            );
          },
        );
      },
    );
  }
}
