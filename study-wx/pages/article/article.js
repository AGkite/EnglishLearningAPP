// pages/article/article.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    articleData: null,
  },

  onLoad(options) {
    // 从页面参数中获取文章ID
    const articleId = options.articleId;
    // 发起网络请求
    this.getArticleData(articleId);
  },

  getArticleData(articleId) {
    wx.request({
      url: `http://localhost:8080/api/article/getArticle/${articleId}`,
      method: 'GET',
      success: (res) => {
        console.log(res)
        const articleData = res.data.data;
        this.setData({
          articleData: articleData,
        });
      },
      fail: (err) => {
        console.error('Failed to fetch article data:', err);
      },
    });
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