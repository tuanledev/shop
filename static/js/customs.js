function delay(callback, ms) {
    var timer = 0;
    return function () {
        var context = this,
            args = arguments;
        clearTimeout(timer);
        timer = setTimeout(function () {
            callback.apply(context, args);
        }, ms || 0);
    };
}

function showMsg(level,msg,info) {
    switch (level) {
        case "info":
            $.toast({
                heading: msg,
                text: info,
                position: 'top-right',
                loaderBg: '#ff6849',
                icon: 'info',
                hideAfter: 3000,
                stack: 6
            });
            break;
            
        case "warning":
            $.toast({
                heading: msg,
                text: info,
                position: 'top-right',
                loaderBg: '#ff6849',
                icon: 'warning',
                hideAfter: 3000,
                stack: 6
            });
            break;

        case "success":
            $.toast({
                heading: msg,
                text: info,
                position: 'top-right',
                loaderBg: '#ff6849',
                icon: 'success',
                hideAfter: 3000,
                stack: 6
            });
            break;

        case "error":
            $.toast({
                heading: msg,
                text: info,
                position: 'top-right',
                loaderBg: '#ff6849',
                icon: 'error',
                hideAfter: 3000,
                stack: 6
            });
            break;

        default:
            break;
    }
}
