
/**
 * 日历
 * @param obj eles 日期输入框
 * @param boolean dobubble    是否为双日期（true）
 * @param boolean secondNot    有无时分秒（有则true）
 * @return none
 */
function calenders(eles,dobubble,secondNot){
    var singleNot,formatDate;
    if(dobubble ==true){
        singleNot = false;
    }else{
        singleNot = true;
    }
    if(secondNot ==true){
        formatDate = "YYYY-MM-DD HH:mm:ss";
    }else{
        formatDate = "YYYY-MM-DD";
    }

    $(eles).daterangepicker({
        "singleDatePicker": singleNot,
        "timePicker": secondNot,
        "timePicker24Hour": secondNot,
        "timePickerSeconds": secondNot,
        "showDropdowns":true,
        "timePickerIncrement" :1,
        "linkedCalendars": false,
        "autoApply":true,
        "autoUpdateInput":false,
        "locale": {
            "direction": "ltr",
            "format": formatDate,
            "separator": "~",
            "applyLabel": "Apply",
            "cancelLabel": "Cancel",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "daysOfWeek": [
                "Su",
                "Mo",
                "Tu",
                "We",
                "Th",
                "Fr",
                "Sa"
            ],
            "monthNames": [
                "一月",
                "二月",
                "三月",
                "四月",
                "五月",
                "六月",
                "七月",
                "八月",
                "九月",
                "十月",
                "十一月",
                "十二月"
            ],
            "firstDay": 1
        }
    }, function(start,end, label) {
        if(secondNot ==true&&dobubble ==true){
            $(eles).val($.trim(start.format('YYYY-MM-DD HH:mm:ss')+'~'+end.format('YYYY-MM-DD HH:mm:ss')));
        }else if(secondNot ==false&&dobubble ==true){
            $(eles).val($.trim(start.format('YYYY-MM-DD')+'~'+ end.format('YYYY-MM-DD')));
        }else if(secondNot ==false&&dobubble ==false){
            $(eles).val(start.format('YYYY-MM-DD'));
        }else if(secondNot ==true&&dobubble ==false){
            $(eles).val(start.format('YYYY-MM-DD HH:mm:ss'));
        }
    });
    //清空
    $(eles).siblings().click(function(){
        $(eles).val('');
    })
}