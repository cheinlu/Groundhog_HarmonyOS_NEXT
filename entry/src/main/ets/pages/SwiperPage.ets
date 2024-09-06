@Entry
@Component
struct SwiperPage {
  //轮播图数据源
  @State swiperList: ResourceStr[] = [
    $r("app.media.swiper_one"), $r("app.media.swiper_two"), $r("app.media.swiper_three"), $r("app.media.swiper_four"),
    $r("app.media.swiper_five")
  ]
  @State selectedIndex: number = 0 //默认选中索引为0

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Swiper() {
        ForEach(this.swiperList, (item: ResourceStr, index: number) => {
          Image(item)
            .width('100%')
            .height('100%')
        })
      }
      .onChange((index: number) => {
        this.selectedIndex = index
      })
      .autoPlay(true)
      .indicator(false)
      .itemSpace(0)
      .width('100%')
      .height('50%')

      //此处为自定义角标
      if (this.swiperList.length > 1) {
        List({ space: 5 }) {
          ForEach(this.swiperList, (item: ResourceStr, index: number) => {
            ListItem() {
              Image(this.selectedIndex === index ? $r("app.media.carousel_blue") : $r("app.media.carousel_gary"))
                .width(20)
                .aspectRatio(1)
            }
          })
        }
        .listDirection(Axis.Horizontal)
        .align(Alignment.Center)
        .enableScrollInteraction(false)
        .hitTestBehavior(HitTestMode.Transparent)
        .constraintSize({ maxWidth: '90%' })
        .height(20)
        .margin({ left: 20, bottom: 20, right: 20 })
      }
    }
  }
}