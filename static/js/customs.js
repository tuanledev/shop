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

function tinyContent(id, hostName, controller) {
    tinymce.init({
        selector: id,
        language: 'vi_VN',
        theme: "modern",
        height: 300,
        plugins: [
            "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
            "save table contextmenu directionality emoticons template paste textcolor "
        ],
        toolbar: " insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons ",
        // powerpaste_allow_local_images: true,
        // powerpaste_word_import: 'prompt',
        // powerpaste_html_import: 'prompt',

        // URL
        relative_urls: true,
        remove_script_host: true,
        document_base_url: "/",
        // convert_urls: true,

        font_formats: 'Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;AkrutiKndPadmini=Akpdmi-n',
        image_title: true,
        image_advtab: true,
        file_picker_types: 'image',
        // images_upload_base_path: '{{UrlHost}}/static/filemanager/product/',

        // automatic_uploads: true,
        images_reuse_filename: true,
        // without images_upload_url set, Upload tab won't show up
        // we override default upload handler to simulate successful upload
        images_upload_handler: function (blobInfo, success, failure) {
            setTimeout(function () {
                var xsrf = $("#_xsrf").val();
                var fd = new FormData();
                fd.append('file', blobInfo.blob());
                fd.append('_xsrf', xsrf);
                $.ajax({
                    url: controller,
                    data: fd,
                    processData: false,
                    contentType: false,
                    type: 'POST',
                    success: function (data) {
                        if (data.status === "success") {
                            success(data.imgPath);
                        } else {
                            failure(data.msg)
                        }
                    }
                });
            },1000);
        },

        // setup: function (editor) {
        //     editor.addButton('uploadfile', {
        //         text: 'Chèn ảnh | Word',
        //         icon: false,
        //         onclick: function () {
        //             $('#' + element_Files).click();
        //         },
        //         change: function () {
        //             editor.save();
        //         }
        //     });
        //     editor.on("change", function () {
        //         var contents = tinymce.get(element_Editor).getContent();
        //         $('#' + element_Editor).val(contents);
        //     })
        // }
    });
}
