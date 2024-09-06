import { GoodsListModel } from '../mode/GoodsListModel'
import { ScreenUtils } from '../utils/ScreenUtils'

@Component
export struct GoodsItemView {
  @Prop goodsItem: GoodsListModel
  goodsWidth = (ScreenUtils.getInstance().getScreenWidthVp() - 12 * 2 - 9) / 2

  build() {
    Column() {
      //商品图
      Image(this.goodsItem.goodsImage)
        .width(this.goodsWidth)
        .height(this.goodsWidth)
        .objectFit(ImageFit.Cover)
      //标题
      Row() {
        Text(this.goodsItem.goodsName)
          .fontSize(12)
          .margin({ top: 8, bottom: 4 })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }.padding({ left: 12, right: 12 }).justifyContent(FlexAlign.Start).width('100%')

      //描述
      Row() {
        Text(this.goodsItem.goodsDescribe)
          .fontSize(12)
          .margin({ top: 4, bottom: 4 })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }.padding({ left: 12, right: 12 }).justifyContent(FlexAlign.Start).width('100%')

      //价格与购物车
      Row() {
        Text(this.goodsItem.goodsPrice)
          .width(100).height(25)
        Image($r('app.media.goods_cart'))
          .size({ width: 24, height: 24 })
          .objectFit(ImageFit.Contain)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .padding({ left: 12, right: 12 })
    }
    .backgroundColor(Color.White)
    .borderRadius(8)
    .clip(true)
    .width(this.goodsWidth)
  }
}