// pages/my/my.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 本月指的是选择的当前月份
    year: new Date().getFullYear(),
    month: new Date().getMonth() + 1,
    nowMonth: new Date().getMonth() + 1, //本月是几月
    nowDay: new Date().getDate(), //本月当天的日期
    weeksArr: ['日', '一', '二', '三', '四', '五', '六'],
    lastMonthDays: [], //上一个月
    nowMonthDays: [], //本月 
    nextMonthDays: [], //下一个月
    timeDate: new Date().toLocaleDateString(), //当前时间
    lastType: "nowMonthDays", //上一次选中的时间类型,默认为本月
    hiddenBlean1:true,
       hiddenBlean2:false,
       userInfo:'',//用户信息
       nickName:'',//用户姓名
       avatarUrl:'',//用户头像地址
       m:0,//用户的登录状态
  },
  gotoLogs:function(){
    wx.navigateTo({
      url: '../logs/logs',
    })
  },
  loginOut:function(){
    wx.navigateTo({
      url: '../login/login',
    })
  },
  //创建时间
  createDays(year, month) {
    this.getLastMonthDays(year, month)
    this.getNowMonthDays(year, month)
    this.getNextMonthDays(year, month)
  },
  //获取当月天数
  getThisMonthDays(year, month) {
    return new Date(year, month, 0).getDate();
  },
  //绘制上个月天数
  getLastMonthDays(year, month) {
    let nowMonthFirstDays = new Date(year, month - 1, 1).getDay()
    let lastMonthDays = []
    if (nowMonthFirstDays) { //判断当月的第一天是不是星期天
      //上个月显示多少天
      let lastMonthNums = month - 1 < 0 ? this.getThisMonthDays(year - 1, 12) : this.getThisMonthDays(year, month - 1); //判断是否会跨年
 
      //上个月从几号开始显示
      for (let i = lastMonthNums - nowMonthFirstDays + 1; i <= lastMonthNums; i++) {
        let time = new Date(year, month - 2, i).toLocaleDateString() //对应的时间
        lastMonthDays.push({
          date: i, //几号
          week: this.data.weeksArr[new Date(year, month - 2, i).getDay()], //星期几
          time,
          isNowMonthDay: ''
        });
      }
    }
    this.setData({
      lastMonthDays
    })
  },
  //绘制当月天数
  getNowMonthDays(year, month) {
    let {
      nowMonth,
      nowDay
    } = this.data
    let nowMonthDays = []
    let days = this.getThisMonthDays(year, month); //获取当月的天数
    for (let i = 1; i <= days; i++) {
      let time = new Date(year, month - 1, i).toLocaleDateString()
      nowMonthDays.push({
        date: i, //几号
        week: this.data.weeksArr[new Date(year, month - 1, i).getDay()], //星期几
        time,
        isNowMonthDay: (month == nowMonth && i == nowDay) ? "isNowMonthDay" : (i == nowDay) ? "isNotNowMonthDay" : ""
      });
    }
    this.setData({
      nowMonthDays
    })
  },
  //绘制下个月
  getNextMonthDays(year, month) {
    let {
      lastMonthDays,
      nowMonthDays,
    } = this.data
    let nextMonthDays = []
    let nextMonthNums = (lastMonthDays.length + nowMonthDays.length) > 35 ? 42 - (lastMonthDays.length + nowMonthDays.length) : 35 - (lastMonthDays.length + nowMonthDays.length) //下个月显示多少天
    let nowYear = (parseInt(month) + 1) > 12 ? year + 1 : year //下一个月的年份
    let nowMonth = (parseInt(month) + 1) > 12 ? 1 : parseInt(month) + 1 //下一个月的月份
    if (nextMonthNums) { //判断当前天数是否大于零
      for (let i = 1; i <= nextMonthNums; i++) {
        let time = new Date(year, month - 1, i).toLocaleDateString()
        nextMonthDays.push({
          date: i, //几号
          week: this.data.weeksArr[new Date(nowYear, nowMonth - 1, i).getDay()], //星期几
          time,
          isNowMonthDay: ''
        });
      }
    }
    this.setData({
      nextMonthDays
    })
    // console.log(nextMonthDays)
  },
  //切换月份
  changeMonth(e) {
    let {
      year,
      month
    } = this.data
    let type = e.currentTarget.dataset.type //类型
    if (type == 'pre') { //上一个月
      year = month - 1 > 0 ? year : year - 1
      month = month - 1 > 0 ? month - 1 : 12
    } else { //next 下个月
      year = (parseInt(month) + 1) > 12 ? year + 1 : year
      month = (parseInt(month) + 1) > 12 ? 1 : parseInt(month) + 1
    }
    this.setData({
      year,
      month,
      lastType: "nowMonthDays", //切换月份，时间类型默认为本月
    })
    this.createDays(year, month)
  },
  //选择时间
  selectDate(e) {
    let type = e.currentTarget.dataset.type //选择的时间类型
    let index = e.currentTarget.dataset.index //选择的下标
    // console.log("选择的时间",type,index)
    let {
      lastType
    } = this.data
    //将上一次选择的时间类型的 isNowMonthDay 全改为''
    this.data[lastType]?.forEach(item => { 
      item.isNowMonthDay = ''
    })
    this.data[type]?.forEach((item, idx) => {
      if (index == idx) {
        item.isNowMonthDay = (item.time == new Date().toLocaleDateString() ? "isNowMonthDay" : "isNotNowMonthDay"); //判断当前选中的日期是否是当前时间
      } else {
        item.isNowMonthDay = ''
      }
    })
    this.setData({
      [lastType]: this.data[lastType],
      [type]: this.data[type],
      lastType: type
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
    let {
      year,
      month
    } = this.data
    this.createDays(year, month)
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