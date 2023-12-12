// pages/word.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        // 居中显示项的位置
        centerItem: 0,
        // 首页轮播图数据
        coverList: [{
                id: 0,
                url: "../../images/swiper1.jpg"
            },
            {
                id: 1,
                url: "../../images/swiper2.jpg"
            },
            {
                id: 2,
                url: "../../images/swiper3.jpg"
            },
            {
                id: 3,
                url: "../../images/swiper4.jpg"
            },
            {
                id: 4,
                url: "../../images/swiper5.jpg"
            }
        ],
        //单词分类
        categories: [
            { "id": 2001, "name": "高考词汇" },
            { "id": 2002, "name": "CET-4精选" },
            { "id": 2003, "name": "剑桥PET" },
            { "id": 2004, "name": "必修一" },
            { "id": 2005, "name": "必修二" },
            { "id": 2006, "name": "必修三" },
            { "id": 2007, "name": "必修四" },
            { "id": 2008, "name": "Oxford-A1" },
            { "id": 2009, "name": "Oxford-A1" },
            { "id": 2010, "name": "Oxford-A1" },
            { "id": 2011, "name": "Oxford-A1" },
            { "id": 2012, "name": "高考短语" }
          ]
    },
    //轮播图滑动时改变居中项
    handleSwiperChange(e) {
        this.setData({
            centerItem: e.detail.current,
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