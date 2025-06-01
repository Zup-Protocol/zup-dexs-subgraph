export class NativeToken {
  symbol: string;
  decimals: i32;
  name: string;

  constructor(symbol: string, decimals: i32, name: string) {
    this.symbol = symbol;
    this.decimals = decimals;
    this.name = name;
  }
}
