part of "./widget.dart";

class DetailViewImage extends StatelessWidget {
  final String gambarBukti;
  const DetailViewImage({
    Key? key,
    required this.gambarBukti,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utility.baseColor2,
      child: Align(
        alignment: Alignment.center,
        child: Image.network(
          Api.pengajuanTopUpAsset + gambarBukti,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child; // When the image has fully loaded, display it
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Utility.baseColor3,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const TextLabel(text: "Failed to load image");
          },
        ),
      ),
    );
  }
}
