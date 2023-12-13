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
       this.getWordList();
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