import {getTrendingItem, getWenyuItem} from "../model/ModelsData.ets"
import {TrendingItem} from "../model/TrendingItem.ets"
import {TrendingRow} from "./trendingRow.ets"


@Component
export struct TrendingList {
  @State TrendingItem: Array<TrendingItem> = getTrendingItem();

  build() {
    Column() {
      // 按文档，ForEach不一定按顺序渲染
      ForEach(this.TrendingItem, (item, index)=>{
        TrendingRow({item: item, num: index})
      }, item=>item.id)
    }
    .width("100%")
    .height("100%")
  }
}

@Component
export struct WenyuList {
  @State WenyuItem: Array<TrendingItem> = getWenyuItem();
  build() {
    Column() {
      ForEach(this.WenyuItem, (item, index)=>{
        TrendingRow({item:item})
      }, (item)=>item.id.toString())
    }
    .width('100%')
    .height('100%')
  }
}