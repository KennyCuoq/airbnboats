//= require rails-ujs
//= require sweetalert2/dist/sweetalert2.min
//= require_tree .

//Override the default confirm dialog by rails
$.rails.allowAction = function(element){
    if( undefined === element.attr('data-confirm') ){
        return true;
    }

    $.rails.showConfirmDialog(element);
    return false;
};

//User click confirm button
$.rails.confirmed = function(element){
    element.removeAttr('data-confirm');
    element.trigger('click.rails');
};

//Display the confirmation dialog
$.rails.showConfirmDialog = function(element){
    var msg = element.data('confirm');
    alertify.confirm(msg, function(e){
        if(e){
            $.rails.confirmed(element);
            return true;
        }
    })
};
