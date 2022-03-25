import {TrendingList, WenyuList} from "../common/trendingList.ets"

@Entry
@Component
export struct Trending {
  @State  @Watch("trendingChange")  isTrending: boolean = true
  @State swiperFont: FontWeight[] = [FontWeight.Bold, FontWeight.Normal] // 用于控制字体变化
  private swiperController: SwiperController = new SwiperController()

  private trendingChange(): void { // 字体变化
    console.log("状态变化了："+String(this.isTrending))
    this.swiperFont = this.isTrending ? [FontWeight.Bold, FontWeight.Normal]: [FontWeight.Normal, FontWeight.Bold]
  }

  @Builder Header(img: Resource) {
    Stack({
      alignContent: Alignment.Top
    }) {
      Image(img)
        .objectFit(ImageFit.Cover)
        .height("100%")
      Button("#微博热搜#", {
        type: ButtonType.Normal
      }).backgroundColor("#fff")
        .width(330)
        .height(30)
        .margin({top: 8})
        .borderRadius(15)
        .opacity(0.6)
        .fontSize(13)
        .fontColor("#808080")
    }
    .height("40%")
    .width("100%")
  }

  @Builder SwiperText(text: string) {
    Row() {
      Text(text)
        .fontColor("#808080")
        .margin({left: 10})
    }
    .height(30)
    .width("100%")
    .backgroundColor("#f5f5f5")
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Start
    }) {
      if (this.isTrending) {
        this.Header($rawfile("trending/trending-1.jpg"))
      } else {
        this.Header($rawfile("trending/trending-2.jpg"))
      }
      Flex({
        justifyContent: FlexAlign.Center,
        alignItems: ItemAlign.Center
      }) {
        Text("热搜榜").margin({right:20}).fontSize(13).fontWeight(this.swiperFont[0])
          .onClick(()=>{
            this.swiperController.showPrevious()
          })
        Text("文娱榜").margin({right:20}).fontSize(13).fontWeight(this.swiperFont[1])
          .onClick(()=>{
            this.swiperController.showNext()
          })
      }
      .width("100%")
      .height(50)
      .backgroundColor("#fff")
      Swiper(this.swiperController) {
        Column() {
          this.SwiperText("实时热点，每分钟更新一次")
          TrendingList()
        }
        Column() {
          this.SwiperText("文娱热点，按圈内实时热度排序")
          WenyuList()
        }
      }
      .loop(false)
      .duration(200)
      .indicator(false)
      .onChange(()=>{
        this.isTrending = ! this.isTrending
      })
    }
    .width('100%')
    .height("100%")

  }
}