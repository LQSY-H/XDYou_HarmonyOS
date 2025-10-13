export class ClassDotItem{
  getClassDotItem(): boolean[][][] {
    const dotData: boolean[][][] = [
      // 第3周
      [
        [true, true, false, true, true],
        [false, true, true, true, true],
        [true, false, false, true, false],
        [false, true, true, false, true],
        [false, true, false, true, false]
      ],
      // 第4周
      [
        [true, true, false, true, true],
        [false, true, true, true, true],
        [true, false, false, true, false],
        [false, true, false, false, true],
        [false, true, false, true, false]
      ],
      // 第5周
      [
        [true, true, false, false, false],
        [false, true, false, false, false],
        [true, false, false, false, false],
        [false, true, false, false, false],
        [false, true, false, false, false]
      ],
      // 第6周
      [
        [false, false, false, true, true],
        [false, false, false, true, true],
        [false, false, false, true, false],
        [false, false, false, false, true],
        [false, false, false, true, false]
      ],
      // 第7周
      [
        [true, false, false, true, true],
        [false, true, true, true, true],
        [true, false, true, true, false],
        [false, true, false, false, true],
        [false, true, false, false, true]
      ]
    ];
    return dotData;
  }
}
export default new ClassDotItem();