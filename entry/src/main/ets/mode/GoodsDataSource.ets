import { BasicDataSource } from './BasicDataSource';
import { GoodsListModel } from './GoodsListModel';

export class GoodsDataSource extends BasicDataSource<GoodsListModel> {
  goodsList:Array<GoodsListModel> = []
  // 获取数据列表长度
  public totalCount(): number {
    return this.goodsList.length;
  }
  // 根据index获取具体项
  public getData(index: number): GoodsListModel {
    return this.goodsList[index];
  }

  public addData(index: number, data: GoodsListModel): void {
    this.goodsList.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushDataList(data: GoodsListModel[]): void {
    this.goodsList = this.goodsList.concat(data);
    this.notifyDataAdd(this.goodsList.length - data.length);
  }

  public pushDataItem(data: GoodsListModel): void {
    this.goodsList.push(data);
    this.notifyDataAdd(this.goodsList.length - 1);
  }

  public deleteData(index: number): void {
    this.goodsList.splice(index, 1);
    this.notifyDataDelete(index);
  }

  public moveData(from: number, to: number): void {
    let temp: GoodsListModel = this.goodsList[from];
    this.goodsList[from] = this.goodsList[to];
    this.goodsList[to] = temp;
    this.notifyDataMove(from, to);
  }

  public changeData(index: number, data: GoodsListModel): void {
    this.goodsList.splice(index, 1, data);
    this.notifyDataChange(index);
  }

  public refreshData(list: []) {
    this.goodsList = list
    this.notifyDataReload()
  }

  public reloadData(): void {
    this.notifyDataReload();
  }

  public modifyAllData(changeItem: (item: GoodsListModel) => GoodsListModel): void {
    this.goodsList = this.goodsList.map((item: GoodsListModel) => {
      return changeItem(item);
    })
  }

}