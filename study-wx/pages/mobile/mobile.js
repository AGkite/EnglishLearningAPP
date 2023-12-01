// pages/mobile/mobile.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    phone: '',
    code: '',
    disabled: false,
    codeText: '获取验证码',
    agreement: false
  },
  onInputPhone(e) {
    this.setData({
      phone: e.detail.value
    })
  },
  onInputCode(e) {
    this.setData({
      code: e.detail.value
    })
  },
  onGetCode() {
    // 在按钮被点击后改变按钮状态为disabled，并修改按钮文字为30s后重试
    let count = 30
    let timer = setInterval(() => {
      count--
      if (count === 0) {
        clearInterval(timer)
        this.setData({
          disabled: false,
          codeText: '获取验证码'
        })
      } else {
        this.setData({
          codeText: `${count} 秒后重试`
        })
      }
    }, 1000)
    this.setData({
      disabled: true
    })
    // 获取验证码逻辑代码
    // TODO:
  },
  onAgree(e) {
    this.setData({
      agreement: e.detail.value.length > 0
    })
  },
  onSubmit(e) {
    const phoneReg = /^1[3456789]\d{9}$/
    if (!phoneReg.test(this.data.phone)) {
      wx.showToast({
        title: '请输入正确的手机号码',
        icon: 'none'
      })
      return
    }
    if (!this.data.code) {
      wx.showToast({
        title: '请输入验证码',
        icon: 'none'
      })
      return
    }
    // 登录请求逻辑代码
    // TODO:
  },
  gotoindex:function(){
    wx.switchTab({
      url: '../my/my',
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {

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