import { display } from '@kit.ArkUI'

export class ScreenUtils {
  //屏幕数据
  private defaultDisplay: display.Display | null = null

  private static instance: ScreenUtils;

  private constructor() {
    this.defaultDisplay = display.getDefaultDisplaySync()
  }

  public static getInstance(): ScreenUtils {
    if (!ScreenUtils.instance) {
      ScreenUtils.instance = new ScreenUtils();
    }
    return ScreenUtils.instance;
  }

  getScreenWidthVp(): number {
    return px2vp(this.defaultDisplay?.width ?? -1)
  }
}