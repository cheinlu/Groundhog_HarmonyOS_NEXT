import { GoodsListModel } from '../mode/GoodsListModel';
import { productList } from '../mode/ProductDataModel';
import dayjs from 'dayjs'
@Entry
@Component
struct ListPage {
  @State message: string = 'Hello World';

  build() {
    List({space:20}){
      ForEach(productList,(goods:GoodsListModel)=>{
        ListItem(){
          Column() {
            //包裹
            Row() {
              Text(goods.floorName).fontSize(14).fontWeight(500).fontColor('#EA7224')
              Text(goods.orderStatusName).fontSize(12).fontWeight(400).fontColor('#4F5355')
            }.width('100%').height(44).justifyContent(FlexAlign.SpaceBetween)

            //商品
            Row() {
              Row() {
                Image(goods.goodsImage)
                  .width(72)
                  .height(72)
                  .borderRadius(8)
                  .backgroundColor(Color.White)
                  .margin({ right: 8 })
                Text(goods.goodsName)
                  .fontSize(14)
                  .fontWeight(400)
                  .fontColor('#222427')
                  .width(160)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }.alignItems(VerticalAlign.Top)

              Column() {
                Row() {
                  Text(`共${goods.goodsBuyQuantity}件`).fontSize(12).fontWeight(400).fontColor('#222427')
                }

                Row() {
                  Text('¥').fontSize(12).fontWeight(FontWeight.Bold).fontColor('#222427')
                  Text(`${goods.goodsPrice}`).fontSize(16).fontWeight(FontWeight.Bold).fontColor('#222427')
                }.alignItems(VerticalAlign.Bottom).margin({ top: 2 })
              }.alignItems(HorizontalAlign.End)
            }
            .width('100%').justifyContent(FlexAlign.SpaceBetween)

            //下单时间
            Row() {
              Text() {
                Span('下单时间：')
                Span(dayjs(Number(goods.goodsCreateTime)).format('YYYY-MM-DD HH:mm:ss'))
              }
              .fontSize(12).fontWeight(400).fontColor('#4F5355')

            }.height(25).width('100%').justifyContent(FlexAlign.End)

            //按钮
            Row() {
              Row() {
                Text('申请发票').fontSize(13).fontWeight(400).fontColor('#222427')
              }
              .padding({
                left: 8,
                right: 8,
                top: 5,
                bottom: 5
              })
              .border({
                width: 1,
                style: BorderStyle.Solid,
                color: '#C9CED3',
                radius: 4
              })

              Row() {
                Text('再次购买').fontSize(13).fontWeight(400).fontColor('#0165B8')
              }
              .padding({
                left: 8,
                right: 8,
                top: 5,
                bottom: 5
              })
              .border({
                width: 1,
                style: BorderStyle.Solid,
                color: '#0165B8',
                radius: 4
              })
              .margin({ left: 12 })
            }
            .width('100%')
            .height(56)
            .justifyContent(FlexAlign.End)
          }
          .backgroundColor(Color.White)
          .borderRadius(12)
          .padding({ left: 12, right: 12 })
          .borderWidth(1)
          .margin({ left:12,right:12 })
        }
      })
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
    .listDirection(Axis.Vertical)
    .width('100%')
    .height('100%')
  }
}