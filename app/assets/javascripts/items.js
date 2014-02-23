var $path_base = "/";
var grid_data = "#{@items.to_json}";
var state_list = "";

jQuery(function($) {
  var grid_selector = "#items-table";
  var pager_selector = "#items-pager";

  jQuery(grid_selector).jqGrid({
    //direction: "rtl",
    //postData: {authenticity_token: "#{form_authenticity_token}"},
    data: grid_data,
    datatype: "local",
    height: 250,
    colNames:[' ', 'Item no','Item name','Item price East','Item price West', 'Shipping point',
              'UPC code', 'Pre UPC name', 'Item description','Origin country',
              'Shelf Life From Dom', 'Shelf Life Guaranteed Dom', 'Spoil Allowance',
              'Sell Unit Dimension', 'Sell Unit Net Weight', 'Sell Unit Quantity Master Pack',
              'Master Pack Dimension', 'Master Pack Cube', 'Master Pack Net Weight',
              'Master Pack Gross Weight', 'Master Pack Quantity Pallet', 'Pallet Config',
              'Pallet Dimension', 'Pallet', 'Pallet Weight', 'Pallet Exchange', 'Truckload Quaantity'],
    colModel:[
      {
        name:'myac',index:'', width:75, fixed:true, sortable:false, resize:false,
        formatter:'actions',
          formatoptions: {
            keys:true,
            delOptions: {recreateForm: true, beforeShowForm:beforeDeleteCallback},
                        //editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
            }
      },
      {name:'item_no',index:'Item no', width:60, editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'item_name',index:'Item name',width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'unit_price_e',index:'Item price East', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'unit_price_w',index:'Item price West', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'item_shipping_point',index:'Shipping point', width:60,editable: true,editoptions:{maxlength:"30"}},
      {name:'upc_code',index:'UPC code', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'pre_upc_code',index:'Pre UPC name', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'item_desc',index:'Item description', width:60,editable: true, editoptions:{maxlength:"30"}},
      {name:'origin_country',index:'Origin country', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'shelf_life_from_dom',index:'Shelf Life From Dom', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'shelf_life_guaranteed_dom',index:'Shelf Life Guaranteed Dom', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'spoil_all',index:'Spoil Allowance', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'sell_unit_dim',index:'Sell Unit Dimension', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'sell_unit_net_weight',index:'Sell Unit Net Weight', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'sell_unit_qty_mstr_pk',index:'Sell Unit Quantity Master Pack', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'master_pk_dim',index:'Master Pack Dimension', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'master_pack_cube',index:'Master Pack Cube', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'master_pk_net_weight',index:'Master Pack Net Weight', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'master_pack_gross_weight',index:'Master Pack Gross Weight', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'master_pack_qty_pallet',index:'Master Pack Quantity Pallet', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'pallet_config',index:'Pallet Config', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'pallet_dim',index:'Pallet Dimension', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'pallet',index:'Pallet', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'pallet_weight',index:'Pallet Weight', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'pallet_xchng',index:'Pallet Exchange', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'truckload_qty',index:'Truckload Quaantity', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
    ],

    viewrecords : true,
    rowNum:10,
    rowList:[10,20,30],
    pager : pager_selector,
    altRows: true,
    //toppager: true,

    multiselect: true,
    //multikey: "ctrlKey",
    multiboxonly: true,

    loadComplete : function() {
        var table = this;
        setTimeout(function(){
            styleCheckbox(table);

            updateActionIcons(table);
            updatePagerIcons(table);
            enableTooltips(table);
        }, 0);
    },

    editurl: $path_base+"items/jqedit",//nothing is saved
    caption: "Manage Items",
    autowidth: true
  });

    //enable search/filter toolbar
    //jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})

    //switch element when editing inline
    function aceSwitch( cellvalue, options, cell ) {
        setTimeout(function(){
            $(cell) .find('input[type=checkbox]')
                    .wrap('<label class="inline" />')
                .addClass('ace ace-switch ace-switch-5')
                .after('<span class="lbl"></span>');
        }, 0);
    }
    //enable datepicker
    function pickDate( cellvalue, options, cell ) {
        setTimeout(function(){
            $(cell) .find('input[type=text]')
                    .datepicker({format:'yyyy-mm-dd' , autoclose:true});
        }, 0);
    }


    //navButtons
    jQuery(grid_selector).jqGrid('navGrid',pager_selector,
        {   //navbar options
            edit: true,
            editicon : 'fa fa-pencil blue',
            add: true,
            addicon : 'fa fa-plus-circle purple',
            del: true,
            delicon : 'fa fa-trash-o red',
            search: true,
            searchicon : 'fa fa-search orange',
            refresh: true,
            refreshicon : 'fa fa-refresh green',
            view: true,
            viewicon : 'fa fa-search-plus grey',
        },
        {
            //edit record form
            //closeAfterEdit: true,
            recreateForm: true,
            beforeShowForm : function(e) {
                var form = $(e[0]);
                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_edit_form(form);
            }
        },
        {
            //new record form
            closeAfterAdd: true,
            recreateForm: true,
            viewPagerButtons: false,
            beforeShowForm : function(e) {
                var form = $(e[0]);
                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_edit_form(form);
            }
        },
        {
            //delete record form
            recreateForm: true,
            beforeShowForm : function(e) {
                var form = $(e[0]);
                if(form.data('styled')) return false;

                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_delete_form(form);

                form.data('styled', true);
            },
            onClick : function(e) {
                alert(1);
            }
        },
        {
            //search form
            recreateForm: true,
            afterShowSearch: function(e){
                var form = $(e[0]);
                form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                style_search_form(form);
            },
            afterRedraw: function(){
                style_search_filters($(this));
            }
            ,
            multipleSearch: true,
            /**
            multipleGroup:true,
            showQuery: true
            */
        },
        {
            //view record form
            recreateForm: true,
            beforeShowForm: function(e){
                var form = $(e[0]);
                form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
            }
        }
    )



    function style_edit_form(form) {
        //enable datepicker on "sdate" field and switches for "stock" field
        form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
            .end().find('input[name=stock]')
                  .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

        //update buttons classes
        var buttons = form.next().find('.EditButton .fm-button');
        buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
        buttons.eq(0).addClass('btn-primary').prepend('<i class="fa fa-ok"></i>');
        buttons.eq(1).prepend('<i class="fa fa-remove"></i>')

        buttons = form.next().find('.navButton a');
        buttons.find('.ui-icon').remove();
        buttons.eq(0).append('<i class="fa fa-chevron-left"></i>');
        buttons.eq(1).append('<i class="fa fa-chevron-right"></i>');
    }

    function style_delete_form(form) {
        var buttons = form.next().find('.EditButton .fm-button');
        buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
        buttons.eq(0).addClass('btn-danger').prepend('<i class="fa fa-trash"></i>');
        buttons.eq(1).prepend('<i class="fa fa-remove"></i>')
    }

    function style_search_filters(form) {
        form.find('.delete-rule').val('X');
        form.find('.add-rule').addClass('btn btn-xs btn-primary');
        form.find('.add-group').addClass('btn btn-xs btn-success');
        form.find('.delete-group').addClass('btn btn-xs btn-danger');
    }
    function style_search_form(form) {
        var dialog = form.closest('.ui-jqdialog');
        var buttons = dialog.find('.EditTable')
        buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'fa fa-retweet');
        buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'fa fa-comment-alt');
        buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'fa fa-search');
    }

    function beforeDeleteCallback(e) {
        var form = $(e[0]);
        if(form.data('styled')) return false;

        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
        style_delete_form(form);

        form.data('styled', true);
    }

    function beforeEditCallback(e) {
        var form = $(e[0]);
        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
        style_edit_form(form);
    }



    //it causes some flicker when reloading or navigating grid
    //it may be possible to have some custom formatter to do this as the grid is being created to prevent this
    //or go back to default browser checkbox styles for the grid
    function styleCheckbox(table) {
    
        $(table).find('input:checkbox').addClass('ace')
        .wrap('<label />')
        .after('<span class="lbl align-top" />')


        $('.ui-jqgrid-labels th[id*="_cb"]:first-child')
        .find('input.cbox[type=checkbox]').addClass('ace')
        .wrap('<label />').after('<span class="lbl align-top" />');
    
    }


    //unlike navButtons icons, action icons in rows seem to be hard-coded
    //you can change them like this in here if you want
    function updateActionIcons(table) {
        /**
        var replacement =
        {
            'ui-icon-pencil' : 'icon-pencil blue',
            'ui-icon-trash' : 'icon-trash red',
            'ui-icon-disk' : 'icon-ok green',
            'ui-icon-cancel' : 'icon-remove red'
        };
        $(table).find('.ui-pg-div span.ui-icon').each(function(){
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
            if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
        })
        */
    }

    //replace icons with FontAwesome icons like above
    function updatePagerIcons(table) {
        var replacement =
        {
            'ui-icon-seek-first' : 'fa fa-angle-double-left bigger-140',
            'ui-icon-seek-prev' : 'fa fa-angle-left bigger-140',
            'ui-icon-seek-next' : 'fa fa-angle-right bigger-140',
            'ui-icon-seek-end' : 'fa fa-angle-double-right bigger-140'
        };
        $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

            if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
        })
    }

    function enableTooltips(table) {
        $('.navtable .ui-pg-button').tooltip({container:'body'});
        $(table).find('.ui-pg-div').tooltip({container:'body'});
    }

    //var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
});