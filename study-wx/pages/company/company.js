// pages/company/company.js
const app = getApp();
// 手机的宽度
var windowWRPX = 750
var pixelRatio = wx.getSystemInfoSync().pixelRatio
Page({
  /**
   * 页面的初始数据
   */
  data: {
    topLabel: '头像上传', //顶部栏
    // 初始化的宽高
    cropperInitW: windowWRPX,
    cropperInitH: windowWRPX,
    // 动态的宽高
    cropperW: windowWRPX,
    cropperH: windowWRPX,
    // 动态的left top值
    cropperL: 0,
    cropperT: 0,
    // 图片缩放值
    scaleP: 0,
    imageW: 0,
    imageH: 0,
    // 裁剪框 宽高
    cutW: 0,
    cutH: 0,
    cutL: 0,
    cutT: 0,
  },
    getimginfo(e) { //获取图片信息
    wx.getImageInfo({
      src: e.detail.avatarUrl,
      success: res => {
        var innerAspectRadio = res.width / res.height;
        // 根据图片的宽高显示不同的效果   保证图片可以正常显示
        if (innerAspectRadio >= 1) {
          this.setData({
            cropperW: windowWRPX,
            cropperH: windowWRPX / innerAspectRadio,
            // 初始化left right
            cropperL: Math.ceil((windowWRPX - windowWRPX) / 2),
            cropperT: Math.ceil((windowWRPX - windowWRPX / innerAspectRadio) / 2),
            // 裁剪框  宽高  
            cutW: windowWRPX,
            cutH: windowWRPX / innerAspectRadio,
            cutL: 0,
            cutT: 0,
            // 图片缩放值
            scaleP: res.width * pixelRatio / windowWRPX,
            // 图片原始宽度 rpx
            imageW: res.width * pixelRatio,
            imageH: res.height * pixelRatio
          })
        } else {
          this.setData({
            cropperW: windowWRPX * innerAspectRadio,
            cropperH: windowWRPX,
            // 初始化left right
            cropperL: Math.ceil((windowWRPX - windowWRPX * innerAspectRadio) / 2),
            cropperT: Math.ceil((windowWRPX - windowWRPX) / 2),
            // 裁剪框的宽高
            cutW: windowWRPX * innerAspectRadio,
            cutH: windowWRPX,
            cutL: 0,
            cutT: 0,
            // 图片缩放值
            scaleP: res.width * pixelRatio / windowWRPX,
            // 图片原始宽度 rpx
            imageW: res.width * pixelRatio,
            imageH: res.height * pixelRatio
          })
        }
        this.upfile(e.detail.avatarUrl)
      }
    })
  },
  upfile(url) { //上传图片
    wx.getFileSystemManager().getFileInfo({
      filePath: url,
      success: res => {
        if (res.size > 10000) { //大于10KB就压缩
          const ctx = wx.createCanvasContext('myCanvas')
          ctx.drawImage(url)
          ctx.draw(true, () => {
            // 获取画布要裁剪的位置和宽度   均为百分比 * 画布中图片的宽度    保证了在微信小程序中裁剪的图片模糊  位置不对的问题
            let canvasW = (this.data.cutW / this.data.cropperW) * (this.data.imageW / pixelRatio)
            let canvasH = (this.data.cutH / this.data.cropperH) * (this.data.imageH / pixelRatio)
            let canvasL = (this.data.cutL / this.data.cropperW) * (this.data.imageW / pixelRatio)
            let canvasT = (this.data.cutT / this.data.cropperH) * (this.data.imageH / pixelRatio)
            setTimeout(() => {
              wx.canvasToTempFilePath({
                x: canvasL,
                y: canvasT,
                width: canvasW,
                height: canvasH,
                destWidth: canvasW * 0.35, //设置压缩百分比，如果写100就是分辨率
                destHeight: canvasH * 0.35, //设置压缩百分比，如果写100就是分辨率
                canvasId: 'myCanvas',
                fileType: 'jpg',
                success: res => {
                  wx.uploadFile({
                    url: App.uploads + '/file/api/upload',
                    filePath: res.tempFilePath,
                    name: 'file',
                    header: {
                      authToken: wx.getStorageSync('token'),
                    },
                    success: res => {
                      res.data = JSON.parse(res.data)
                      this.data.tx = res.data.data.filePath
                      this.batchmodify()
                    },
                    fail: res => {
                      wx.hideLoading()
                      wx.showToast({
                        title: '上传失败',
                        icon: "error",
                        duration: 1500
                      })
                    }
                  })
                }
              })
            }, 500);
          })
        } else {
          wx.uploadFile({
            url: App.uploads + '/file/api/upload',
            filePath: url,
            name: 'file',
            header: {
              authToken: wx.getStorageSync('token'),
            },
            success: res => {
              res.data = JSON.parse(res.data)
              this.data.tx = res.data.data.filePath
              this.batchmodify()
            },
            fail: res => {
              wx.hideLoading()
              wx.showToast({
                title: '上传失败',
                icon: "error",
                duration: 1500
              })
            }
          })
        }
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