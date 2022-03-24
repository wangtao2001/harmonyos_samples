import {getNavItem} from "../model/ModelsData.ets"
import {IconItem} from "../model/IconItem.ets"
import {Trending} from "./trending.ets"

@Entry
@Component
struct Index {
  @Provide currentPage: number = 1
  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.End
    }) {
      Scroll() {
        if (this.currentPage == 1) {
          Trending()
        }
      }
      Divider()
      Nav()
    }
    .height("100%")
    .width("100%")
  }
}

@Component
struct Nav {
  @Consume currentPage: number // 当前页
  @State icons: Array<Resource> = [] // 图标数组
  private NavItem: Array<IconItem> = getNavItem();
  aboutToAppear() {
    // 预装填图标
    this.NavItem.forEach(item=>{
      if (item.id == 1) {
        this.icons.push(item.iconSelected)
      } else {
        this.icons.push(item.icon)
      }
    })
  }

  build() {
    Flex({
      justifyContent: FlexAlign.SpaceAround,
      alignItems: ItemAlign.Center
    }) {
      ForEach(this.NavItem, item=>{
        Column() {
          Image(this.icons[item.id])
            .objectFit(ImageFit.Cover)
            .height(30)
            .width(30)
            .renderMode(ImageRenderMode.Original)
            .onClick(()=>{
              // 更新图标
              this.icons[this.currentPage] = this.NavItem[this.currentPage].icon
              this.currentPage = item.id
              this.icons[this.currentPage] = this.NavItem[this.currentPage].iconSelected
            })
          Text(item.title)
          .fontSize(11)
        }
      }, item=>item.id)
    }
    .height(55)
    .width("100%")
  }
}