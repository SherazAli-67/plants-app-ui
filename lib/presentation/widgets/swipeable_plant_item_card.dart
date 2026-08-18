import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:plants_app/router/app_router.dart';
import 'package:provider/provider.dart';
import '../../core/app_data.dart';
import '../../providers/home_provider.dart';
import 'plant_card_item_widget.dart';

class SwipeablePlantCards extends StatelessWidget{
  const SwipeablePlantCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        final controller = provider.pageController;
        return LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = constraints.maxWidth * 0.82;
            const peekDistance = 64.0;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) => _onCarouselDragUpdate(controller, details),
              onHorizontalDragEnd: (details) => _onCarouselDragEnd(controller, details),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  IgnorePointer(
                    child: Opacity(
                      opacity: 0,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: AppData.plants.length,
                        itemBuilder: (_, _) => const SizedBox.expand(),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      var page = 0.0;
                      if (controller.hasClients &&
                          controller.position.haveDimensions) {
                        page = controller.page ?? 0;
                      }
                      final indices = List.generate(AppData.plants.length, (i) => i);
                      indices.sort((a, b) => (b - page).abs().compareTo((a - page).abs()));

                      return Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          for (final index in indices)
                            GestureDetector(
                              onTap: ()=> context.push(NamedRoutes.productDetail.routeName, extra: AppData.plants[index]),
                              child: _buildStackedCard(
                                index: index,
                                page: page,
                                cardWidth: cardWidth,
                                cardHeight: constraints.maxHeight,
                                peekDistance: peekDistance,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _onCarouselDragUpdate(PageController controller, DragUpdateDetails details) {
    if (!controller.hasClients || !controller.position.haveDimensions) {
      return;
    }
    final next = (controller.offset - details.delta.dx).clamp(
      controller.position.minScrollExtent,
      controller.position.maxScrollExtent,
    );
    controller.jumpTo(next.toDouble());
  }

  void _onCarouselDragEnd(PageController controller, DragEndDetails details) {
    if (!controller.hasClients || !controller.position.haveDimensions) {
      return;
    }
    final velocity = details.primaryVelocity ?? 0;
    final page = controller.page ?? 0;
    var target = velocity.abs() > 400
        ? (velocity < 0 ? page.ceil() : page.floor())
        : page.round();
    target = target.clamp(0, AppData.plants.length - 1).toInt();
    controller.animateToPage(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Widget _buildStackedCard({
    required int index,
    required double page,
    required double cardWidth,
    required double cardHeight,
    required double peekDistance,
  }) {
    final delta = index - page;
    final absDelta = delta.abs();
    if (absDelta > 1.4) {
      return const SizedBox.shrink();
    }

    final scale = (1.0 - absDelta * 0.08).clamp(0.88, 1.0);
    final blur = (absDelta * 2).clamp(0.0, 8.0);

    Widget card = SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: PlantCard(plant: AppData.plants[index]),
    );

    if (blur > 0.01) {
      card = ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: card,
      );
    }

    return Transform.translate(
      offset: Offset(delta * peekDistance, 0),
      child: Transform.rotate(
        angle: delta * 0.1,
        child: Transform.scale(
          scale: scale,
          child: card,
        ),
      ),
    );
  }
}