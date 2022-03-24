let nextId = 0

// 热搜榜单数据
// 暂时不做详情，故数据类型简单
export class TrendingItem {
  id: number;
  title: string;
  reading: string;
  label: TrendingLabel;
  constructor(title: string, reading: string, label: TrendingLabel) {
    this.id = nextId++;
    this.title = title;
    this.reading = reading;
    this.label = label;
  }
}

export enum TrendingLabel {
  Hot,
  New,
  Boiling,
  None
}