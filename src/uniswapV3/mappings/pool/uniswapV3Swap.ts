import { Swap as SwapEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";

export function handleUniswapV3Swap(event: SwapEvent): void {
  console.log("Swap eveny");
}
