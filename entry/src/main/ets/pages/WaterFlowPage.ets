import { GoodsDataSource } from '../mode/GoodsDataSource'
import { GoodsListModel } from '../mode/GoodsListModel'
import { productList } from '../mode/ProductDataModel'
import { GoodsItemView } from '../view/GoodsItemView'

@Entry
@Component
struct WaterFlowPage {
  mDataResource = new GoodsDataSource

  aboutToAppear(): void {
    this.mDataResource.pushDataList(productList)
  }

  build() {
    WaterFlow() {
      LazyForEach(this.mDataResource, (item: GoodsListModel) => {
        FlowItem() {
          GoodsItemView({ goodsItem: item })
        }
      })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12 })
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.SELF_FIRST,
    })
    .scrollBar(BarState.Off)
    .columnsTemplate('1fr 1fr')
    .columnsGap(12)
    .rowsGap(8)
    .cachedCount(6) // 懒加载缓存配置
  }
}