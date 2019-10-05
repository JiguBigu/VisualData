var option = {
    color: this.color, //前景条的颜色
    tooltip: {
        show: true,
        formatter: '{c}%'
    },
    grid: {
        left: '3%',
        right: '4%',
        top: 'middle'
    },
    xAxis: [
        {
            show: false,
            type: 'value',
            max: 100 //可以设最大值
        }
    ],
    yAxis: [
        {
            show: false,
            type: 'category',
            data: ['1'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    series: [
        // 背景条
        {
            type: 'bar',
            barWidth: 12,
            silent: true,
            itemStyle: {
                normal: { color: '#003363', barBorderRadius: 45 }
            },
            barGap: '-100%', // 可以使两个条重叠
            barCategoryGap: '50%',
            data: [99]
        },
        // 前景条
        {
            type: 'bar',
            itemStyle: {
                normal: {
                    barBorderRadius: 45
                }
            },
            barWidth: '12',
            data: [this.data]
        },

    ]
};

var option2 = {
    color: this.color, //前景条的颜色
    tooltip: {
        show: true,
        formatter: '{c}%'
    },
    grid: {
        left: '3%',
        right: '4%',
        top: 'middle'
    },
    xAxis: [
        {
            show: false,
            type: 'value',
            max: 100 //可以设最大值
        }
    ],
    yAxis: [
        {
            show: false,
            type: 'category',
            data: ['1'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    series: [
        // 背景条
        {
            type: 'bar',
            barWidth: 12,
            silent: true,
            itemStyle: {
                normal: { color: '#32CD32', barBorderRadius: 45 }
            },
            barGap: '-100%', // 可以使两个条重叠
            barCategoryGap: '50%',
            data: [99]
        },
        // 前景条
        {
            type: 'bar',
            itemStyle: {
                normal: {
                    barBorderRadius: 45
                }
            },
            barWidth: '12',
            data: [this.data]
        },

    ]
};

$(document).ready(function showTask1() {
    var task1Cart = echarts.init(document.getElementById('task1'));
    var task2Cart = echarts.init(document.getElementById('task2'));
    task1Cart.showLoading();
    task1Cart.hideLoading();
    task2Cart.showLoading();
    task2Cart.hideLoading();
    task1Cart.setOption(option);
    task2Cart.setOption(option2);

});