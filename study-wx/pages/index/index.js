// index.js

Page({

  /**
   * 页面的初始数据
   */
  data: {
    token:'24.2aa66424645d0b7a4a10e7c85e2c6993.2592000.1703144838.282335-43441912',//刚刚在百度API网页上获取的access_tokne
    text: "",//初始页面展示的文本内容，对应“请输入翻译内容”下面输入框的文本
    translation: "",//用于接收翻译的结果，然后显示在页面上
  },
  // 点击删除图片时，调用del函数
  del: function (){
    // this.setData可以修改data中的数据，并且刷新页面，显示修改好的新数据
    this.setData({
      text:'',
      translation:''
    })
  },
  // 点击“译”时，调用search函数。这里需用调用wx.request来发起 HTTPS 网络请求。
  // 后附wx.request的说明文档。
  search: function (){
    console.log(this.data.text);
    wx.request({
      // https://aip.baidubce.com/rpc/2.0/mt/texttrans/v1?access_token= 获取方式见 文章的3.（2）
      url: 'https://aip.baidubce.com/rpc/2.0/mt/texttrans/v1?access_token='+this.data.token,
      data:{
        'from':'zh',//源语种方向
        'to':'en',//目标语种方向
        'q':this.data.text//输入的要翻译的内容，我这里用this.data.text来取上面输入的文本内容，即需要翻译的文本内容
      },
      header:{//请求头
        'Content-Type':	'application/json;charset=utf-8'
      },
      method:'POST',//HTTP 方法
      success: (res)=>{//函数调用成功的回调函数
        // 可以打印一下res，然后发现结果存在res.data.result.trans_result[0].dst
        // console.log(res);
        let result = res.data.result.trans_result[0].dst//新建一个变量result来存翻译的结果
        // console.log(res.data.result.trans_result[0].dst)
        this.setData({
          translation:result//把结果展示在页面上
        })
      },
      fail:(err)=>{
        console.log(err);
      }
    })
  },
  // 输入时触发该函数，用于获取要翻译的内容
  inputInfo: function (e){
    // console.log(e.detail.value)
    // this.data.text = e.detail.value
    this.setData({
      text:e.detail.value,
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
