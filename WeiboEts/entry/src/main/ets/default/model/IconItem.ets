let nextId = 0;

// 图标类型数据 分为标题、图标、被选中图标
export class IconItem {
  id: number;
  title: string;
  icon: Resource;
  iconSelected: Resource;

  constructor(title: string, icon: Resource, iconSelected: Resource) {
    this.id = nextId++;
    this.title = title;
    this.icon = icon;
    this.iconSelected = iconSelected;
  }
}