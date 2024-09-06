export class GoodsListModel {
  goodsId?: number //商品ID
  goodsImage?: ResourceStr //商品图片
  goodsName?: string //商品名称
  goodsPrice?: string //商品原价
  goodsDescribe?: string //商品描述
  goodsBuyQuantity?: number //件数
  goodsCreateTime?: string //下单时间
  orderStatusName?:string
  floorName?:string
  floorId?:number
}