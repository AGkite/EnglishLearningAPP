// pages/word/word.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    wordList: [], // 初始化单词列表为空数组
    currentIndex: 0, // 当前显示的单词索引
    showTranslation: false, // 是否显示翻译
    options: [], // 存储翻译选项
    selectedOptionIndex: null // 用户选择的选项索引
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
       // 在页面加载时调用获取单词列表的方法
       this.getWordList(options.courseId);
  },
  getWordList: function(courseId) {
    wx.request({
        url: `http://localhost:8080/api/word/getWords/${courseId}`,
        method: 'GET',
        success: (res) => {
            this.setData({
                wordList: [...this.data.wordList, ...res.data.data]
            })
            console.log(this.data.wordList)
        }
   
    })
  },
  generateOptions: function () {
    const currentIndex = this.data.currentIndex;
    const correctTranslation = this.data.wordList[currentIndex].translate;
    const allTranslations = this.data.wordList.map(word => word.translate);

    // 随机生成三个干扰选项
    const incorrectTranslations = this.getRandomOptions(correctTranslation, allTranslations, 3);

    // 将正确选项和干扰选项合并
    const options = [correctTranslation, ...incorrectTranslations];

    // 随机打乱选项顺序
    const shuffledOptions = this.shuffleArray(options);

    // 更新页面数据
    this.setData({
      options: shuffledOptions,
      selectedOptionIndex: null // 重置用户选择的选项索引
    });
  },

  getRandomOptions: function (correctOption, allOptions, count) {
    const result = [];
    while (result.length < count) {
      const randomIndex = Math.floor(Math.random() * allOptions.length);
      const randomOption = allOptions[randomIndex];
      if (randomOption !== correctOption && !result.includes(randomOption)) {
        result.push(randomOption);
      }
    }
    return result;
  },

  shuffleArray: function (array) {
    const shuffledArray = array.slice();
    for (let i = shuffledArray.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffledArray[i], shuffledArray[j]] = [shuffledArray[j], shuffledArray[i]];
    }
    return shuffledArray;
  },

  toggleTranslation: function () {
    // 切换显示翻译的状态
    this.setData({
      showTranslation: !this.data.showTranslation
    });
  },

  selectOption: function (e) {
    if (this.data.selectedOptionIndex !== null) {
      // 用户已经选择过，不允许再次选择
      return;
    }

    const selectedOptionIndex = parseInt(e.currentTarget.dataset.index);
    const isCorrect = selectedOptionIndex === 0;

    // 更新页面数据
    this.setData({
      selectedOptionIndex
    });

    if (isCorrect) {
      // 如果选择正确，显示绿色，2秒后进入下一个单词
      wx.showToast({
        title: '选择正确',
        icon: 'success',
        duration: 2000,
        success: () => {
          this.nextWord();
        }
      });
    } else {
      // 如果选择错误，显示红色，2秒后恢复并停留在当前单词
      wx.showToast({
        title: '选择错误',
        image: '/images/error.png', // 自定义错误图标路径
        duration: 2000,
        success: () => {
          // 2秒后重置选项颜色
          setTimeout(() => {
            this.setData({
              selectedOptionIndex: null
            });
          }, 2000);
        }
      });
    }
  },

  nextWord: function () {
    // 切换到下一个单词
    const nextIndex = this.data.currentIndex + 1;
    if (nextIndex < this.data.wordList.length) {
      this.setData({
        currentIndex: nextIndex
      });

      // 随机生成下一个单词的翻译选项
      this.generateOptions();
    } else {
      wx.showToast({
        title: '已经是最后一个单词了',
        icon: 'none'
      });
    }
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})