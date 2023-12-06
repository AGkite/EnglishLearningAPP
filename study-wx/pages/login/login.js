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
    username: "",
    password: ""
  },


  //输入账户触发的事件
  nameInput(e) {
    var account = e.detail.value; //获取账号的值
    if (account != "") {
      this.setData({ disabled: false, btnType: "primary", username: account });
    }
  },

  //输入密码触发的事件
  passwordBlur(e) {
    var pwd = e.detail.value;
    if (pwd != "") {
      this.setData({ password: pwd });
    }
  },
  toLogin:function(){
    wx.request({
        url: 'http://localhost:8080/api/login',
        method: 'POST',
        header: {
            'content-type': 'application/json'
        },
        data: {
            username: this.data.username,
            password: this.data.password
        },
        success: function (res) {
            // 登录成功的处理逻辑
            if (res.data.success) {
                // 登录成功的处理逻辑
                console.log(res.data.message); // 输出服务端返回的消息
                wx.switchTab({
                  url: '../my/my',
                });
              } else {
                // 登录失败的处理逻辑
                //console.error(res.data.message); // 输出错误信息
                wx.showToast({
                  title: '登录失败: ' + res.data.message,
                  icon: 'none',
                  duration: 2000
                });
              }
          },
          fail: function (res) {
            // 登录失败的处理逻辑
            console.error(res.data); // 输出错误信息
            wx.showToast({
                title: '网络请求失败，请重试',
                icon: 'none',
                duration: 2000
              });
          }
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