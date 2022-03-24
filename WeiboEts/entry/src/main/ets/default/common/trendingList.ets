import {getTrendingItem, getWenyuItem} from "../model/modelsdata.ets"
import {TrendingItem} from "../model/trendingitem.ets"
import {TrendingRow} from "./trendingRow.ets"

@Entry
@Component
export struct TrendingList {
  @State TrendingItem: Array<TrendingItem> = getTrendingItem();
  build() {
    Column() {

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

    }
    .width('100%')
    .height('100%')
  }
}