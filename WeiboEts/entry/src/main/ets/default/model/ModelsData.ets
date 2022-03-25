import {IconItem} from "./IconItem.ets"
import {TrendingLabel, TrendingItem} from "./TrendingItem.ets"

// 获取导航栏标题与图标
export function getNavItem(): Array<IconItem> {
  let NavItemArray: Array<IconItem> = [];
  Navs.forEach(item=>{
    NavItemArray.push(new IconItem(item.title, item.icon, item.iconSelected))
  });
  return NavItemArray;
}

// 获取热搜
export function getTrendingItem(): Array<TrendingItem> {
  let TrendingItemArray: Array<TrendingItem> = [];
  Trendings.forEach(item=>{
    TrendingItemArray.push(new TrendingItem(item.title, item.reading, item.label))
  })
  return TrendingItemArray;
}

// 获取文娱
export function getWenyuItem(): Array<TrendingItem> {
  let WenyuItemArray: Array<TrendingItem> = [];
  Wenyus.forEach(item=>{
    WenyuItemArray.push(new TrendingItem(item.title, item.reading, item.label))
  })
  return WenyuItemArray;
}

// 导航栏图标
const Navs: any[] = [
  {
    "title": "首页",
    "icon": $rawfile("nav/index.png"),
    "iconSelected": $rawfile("nav/index-fill.png")
  },
  {
    "title": "热搜",
    "icon": $rawfile("nav/search.png"),
    "iconSelected": $rawfile("nav/search-fill.png"),
  },
  {
    "title": "消息",
    "icon": $rawfile("nav/message.png"),
    "iconSelected": $rawfile("nav/message-fill.png"),
  },
  {
    "title": "我",
    "icon": $rawfile("nav/me.png"),
    "iconSelected": $rawfile("nav/me-fill.png"),
  }
]

// 热搜榜单
const Trendings: any[] = [
  {
    "title": "民航局展开为期两周行业安全大检查全面排查安全隐患",
    "reading": "5674207",
    "label": TrendingLabel.Hot
  },
  {
    "title": "天宫课堂第二课",
    "reading": "6645673",
    "label": TrendingLabel.None
  },
  {
    "title": "杭州一小区发生汽车撞人事件",
    "reading": "5439072",
    "label": TrendingLabel.New
  },
  {
    "title": "河北省教育厅最新发布",
    "reading": "485862",
    "label": TrendingLabel.Boiling
  },
  {
    "title": "B站崩了",
    "reading": "9563421",
    "label": TrendingLabel.New
  },
  {
    "title": "回蓝天",
    "reading": "9087812",
    "label": TrendingLabel.None
  },
  {
    "title": "就算隔离也隔离不了爱情",
    "reading": "7863343",
    "label": TrendingLabel.Hot
  }
]

// 文娱榜单
const Wenyus: any[] = [
  {
    "title": "汪小菲微博取关大S",
    "reading": "794597",
    "label": TrendingLabel.New
  }
]