// pages/login/login.js
Page({

  /**
   * 页面的初始数据
   */
  /**
   * 页面的初始数据
   */
  data: {
    disabled: true,
    btnType: "default",
    name: "",
    password: ""
  },


  //输入账户触发的事件
  nameInput(e) {
    var account = e.detail.value; //获取账号的值
    if (account != "") {
      this.setData({ disabled: false, btnType: "primary", name: account });
    }
  },

  //输入密码触发的事件
  passwordBlur(e) {
    var pwd = e.detail.value;
    if (pwd != "") {
      this.setData({ password: pwd });
    }
  },
  gotoindex:function(){
    wx.switchTab({
      url: '../my/my',
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    
  },
  
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
    
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
    
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    
  }
})