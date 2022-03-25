import {TrendingItem, TrendingLabel} from "../model/TrendingItem.ets"


@Component
export struct TrendingRow {
  private item:TrendingItem;  // 传入一整个数据结构
  private num: number; // 热搜顺序

  build() {
    Column() {
      Flex({
        alignItems: ItemAlign.Center
      }) {
        TopLabel({top: this.num })
        Row() {
          Text(this.item.title)
          .fontSize(14)
          .padding({right:5})
          .height("100%")
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .maxLines(1)
          Text(this.item.reading)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor("#808080")
          .textOverflow({overflow: TextOverflow.None})
        }
        .flexGrow(2)
        TypeLabel({label: this.item.label})
      }.height(40).width("100%")
      Divider().color("#DCDCDC").strokeWidth(1)
    }
  }
}

@Component
struct TopLabel {
  private top: number = 0;
  build() {
    Flex({
      justifyContent:FlexAlign.Center,
      alignItems: ItemAlign.Center
    }) {
      if (this.top == 0) {
        Image($rawfile("nav/top.png"))
        .height(15)
        .width(15)
        .objectFit(ImageFit.Cover)
      } else if (this.top <= 3) {
        Text(this.top.toString())
        .fontColor("#d81e06")
        .fontSize(14)
        .fontWeight(FontWeight.Bolder)
        .fontStyle(FontStyle.Italic)
      } else {
        Text(this.top.toString())
        .fontColor("#FF8C00")
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
      }
    }
    .height(35)
    .width(35)
  }
}

@Component
struct TypeLabel {
  private label: TrendingLabel;

  build() {
    Row() {
      if (this.label == TrendingLabel.Boiling) {
        Text("沸").typeLabelStyle().backgroundColor("#d81e06")
      } else if (this.label == TrendingLabel.New) {
        Text("新").typeLabelStyle().backgroundColor("#00BFFF")
      } else if (this.label == TrendingLabel.Hot) {
        Text("热").typeLabelStyle().backgroundColor("#FF8C00")
      }
    }
    .height("100%")
    .backgroundColor(Color.White)
  }
}

@Extend(Text) function typeLabelStyle() {
  .fontColor(Color.White)
  .height(16)
  .width(16)
  .margin({right:10, left: 10})
  .textAlign(TextAlign.Center)
  .borderRadius(2)
}
