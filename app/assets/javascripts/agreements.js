var $path_base = "/";
var grid_data = "#{@agreements.to_json}";
var customer_list = "";
var vendor_list = "";

jQuery(function($) {
  var grid_selector = "#agreements-table";
  var pager_selector = "#agreements-pager";

  var getCustomerDepartments = function(customerId) {
    departments = "";
    return departments;
    // $.ajax({
    //     type: "GET",
    //     url: '/cus_departments',
    //     data: {customer_id: customerId},
    //     dataType: "JSON",
    //     success: function(data) {
    //       return data;
    //     }
    // });
  }

  var getVendorItems = function(vendorId) {

  }

  jQuery(grid_selector).jqGrid({
    //direction: "rtl",
    //postData: {authenticity_token: "#{form_authenticity_token}"},
    data: grid_data,
    datatype: "local",
    height: 250,
    colNames:[' ', 'POs', 'Agreement no','Agreement Date','Agreement customer','Customer department','Agreement Vendor',
        'Item', 'Case Cost East', 'Case Cost West', 'Pricing Option', 'FOB Point', 'Commitment', 'Minimum Com',
        'Minimum per order', 'Unit cost', 'Marketing Allowance', 'Cross Dock Allowance'],
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
      {name:'pos', index:'POs', fixed:true, width: 40,sortable:false, resize:false},
      {name:'agreementno',index:'Agreement no', width:60, editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'agreementdate',index:'Agreement Date',width:60,editable: true, editoptions:{size:"20",maxlength:"30",
          dataInit:function(el){ 
                $(el).datepicker({autoclose:true}).next().on(ace.click_event, function(){
                    $(this).prev().focus();
                });
          }}},
      {name:'agreement_customer',index:'Agreement customer', width:60,editable: true,edittype:"select",
        editoptions:{
            value:customer_list, 
            maxlength:"30",
            dataInit: function(elem) {
                var v = $(elem).val();
                $.ajax({
                    type: "GET",
                    async: false,
                    url: '/cus_departments',
                    cache: false,
                    data: {customer_id: v},
                    complete: function(e) {
                        jQuery(grid_selector).setColProp('agreement_customer_dept', { editoptions: { value: e.responseText } });
                    }
                });
            },
            dataEvents:[
                {
                    type: 'change',
                    fn: function(se) {
                        var v = $(se.target).val();
                        $.ajax({
                            type: "GET",
                            async: false,
                            url: '/cus_departments',
                            cache: false,
                            data: {customer_id: v},
                            complete: function(e) {
                                var htmlOptions = "";
                                var response = e.responseText.toString();
                                if (response != "") {
                                    var option_list = e.responseText.toString().split(";");
                                    for (var i = 0; i < option_list.length; i++) {
                                        var item = option_list[i].split(":");
                                        htmlOptions += '<option role="option" value="' + item[0] + '">' + item[1] + '</option';
                                    }
                                }
                                if ($(se.target).is('.FormElement')) {
                                    var form = $(se.target).closest('form.FormGrid');
                                    $("select", $("tr#tr_agreement_customer_dept.FormData", form[0])).html(htmlOptions);
                                } else {
                                    var row = $(se.target).closest('tr.jqgrow');
                                    var rowId = row.attr('id');
                                    $("select#" + rowId + "_agreement_customer_dept", row[0]).html(htmlOptions);
                                }
                            }
                        });
                    }
                }
            ]
        }},
      {name:'agreement_customer_dept',index:'Customer department', width:60,editable: true,edittype:"select",editoptions:{maxlength:"30"}},
      {name:'agreement_vendor',index:'Agreement Vendor', width:60,editable: true,edittype:"select", 
        editoptions:{
            value:vendor_list,
            maxlength:"30",
            dataInit: function(elem) {
                var v = $(elem).val();
                $.ajax({
                    type: "GET",
                    async: false,
                    url: '/ven_items',
                    cache: false,
                    data: {vendor_id: v},
                    complete: function(e) {
                        jQuery(grid_selector).setColProp('item', { editoptions: { value: e.responseText } });
                    }
                });
            },
            dataEvents:[
                {
                    type: 'change',
                    fn: function(se) {
                        var v = $(se.target).val();
                        $.ajax({
                            type: "GET",
                            async: false,
                            url: '/ven_items',
                            cache: false,
                            data: {vendor_id: v},
                            complete: function(e) {
                                var htmlOptions = "";
                                var response = e.responseText.toString();
                                if (response != "") {
                                    var option_list = e.responseText.toString().split(";");
                                    for (var i = 0; i < option_list.length; i++) {
                                        var item = option_list[i].split(":");
                                        htmlOptions += '<option role="option" value="' + item[0] + '">' + item[1] + '</option';
                                    }
                                }
                                if ($(se.target).is('.FormElement')) {
                                    var form = $(se.target).closest('form.FormGrid');
                                    $("select", $("tr#tr_item.FormData", form[0])).html(htmlOptions);
                                } else {
                                    var row = $(se.target).closest('tr.jqgrow');
                                    var rowId = row.attr('id');
                                    $("select#" + rowId + "_item", row[0]).html(htmlOptions);
                                }
                            }
                        });
                    }
                }
            ]
        }
      },
      {name:'item',index:'Item', width:60,editable: true,edittype:"select",editoptions:{maxlength:"30"}},
      {name:'case_cost',index:'Case Cost East', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'case_cost_w',index:'Case Cost West', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'pricing_option',index:'Pricing Option', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'fob_point',index:'FOB Point', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'commitment_string',index:'Commitment', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'min_com',index:'Minimum Com', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'min_per_order',index:'Minimum per order', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'unit_cost',index:'Unit cost', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'mktg_all',index:'Marketing Allowance', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
      {name:'cross_dock_all',index:'Cross Dock Allowance', width:60,editable: true,editoptions:{size:"20",maxlength:"30"}},
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

    editurl: $path_base+"agreements/jqedit",//nothing is saved
    caption: "Manage Agreements",
    autowidth: true,

    gridComplete: function(){
        var ids = jQuery("#agreements-table").jqGrid('getDataIDs');
        for(var i=0;i < ids.length;i++){
            var cl = ids[i];

            item = "<div title='' style='float:left;margin-left:5px;' class='ui-pg-div ui-inline-del ui-state-hover' id='vendorItems' ";
            item += "onclick=\"window.location.href='/agreements/" + cl + "/pos';\" ";
            item += "onmouseover=\"jQuery(this).addClass('ui-state-hover');\" onmouseout=\"jQuery(this).removeClass('ui-state-hover');\" data-original-title=\"View customer's departments\"><span class=\"ui-icon ui-icon-pencil\"></span></div>"; 
            jQuery("#agreements-table").jqGrid('setRowData',ids[i],{pos:item});
        }   
    }
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