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
        categories: [{
                "id": 2001,
                "name": "高考词汇"
            },
            {
                "id": 2002,
                "name": "CET-4精选"
            },
            {
                "id": 2003,
                "name": "剑桥PET"
            },
            {
                "id": 2004,
                "name": "必修一"
            },
            {
                "id": 2005,
                "name": "必修二"
            },
            {
                "id": 2006,
                "name": "必修三"
            },
            {
                "id": 2007,
                "name": "必修四"
            },
            {
                "id": 2008,
                "name": "Oxford-A1"
            },
            {
                "id": 2009,
                "name": "Oxford-A1"
            },
            {
                "id": 2010,
                "name": "Oxford-A1"
            },
            {
                "id": 2011,
                "name": "Oxford-A1"
            },
            {
                "id": 2012,
                "name": "高考短语"
            }
        ],
        //   文章列表数据
        articleList: [],
        page: 1,
        pageSize: 3,
        total: 0,
        isLoding: false
    },
    // 获取文章列表

    getArticleList(cb) {
        //节流阀
        this.setData({
            isLoding: true
        })
        //显示loding效果
        wx.showLoading({
            title: '数据加载中...',
            duration: 3000
        })
        wx.request({
            url: `http://localhost:8080/api/article/getArticleList`,
            method: 'POST',
            data: {
                current: this.data.page,
                size: this.data.pageSize
            },
            success: (res) => {
                console.log(res)
                this.setData({
                    articleList: [...this.data.articleList, ...res.data.data],
                    total: res.data.total
                })
                console.log(res)
            },
            complete: () => {
                wx.hideLoading()
                this.setData({
                    isLoding: false
                })
                //按需判断是否执行停止下拉刷新
                cb && cb()
            }
        })
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
        this.getArticleList()
    },
    toWord: function(e) {
        var index = e.currentTarget.dataset.index;
        wx.navigateTo({
          url: '../word/word?courseId=' + this.data.categories[index].id
        })
    },
    toArticle: function(e) {
        var id = e.currentTarget.dataset.index;
        wx.navigateTo({
            url: '../article/article?articleId=' + id
        })
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
        //重置关键数据
        this.setData({
            page: 1,
            articleList: [],
            total: 0
        })
        this.getArticleList(() => {
            wx.stopPullDownRefresh()
        })
    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom() {
        //证明没有下一页的数据了
        if (this.data.page * this.data.pageSize >= this.data.total) {
            return wx.showToast({
                title: '数据加载完毕！',
                icon: 'none'
            })
        }
        if (this.data.isLoding) return
        this.setData({
            page: this.data.page + 1
        })
        this.getArticleList()
    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage() {

    }
})