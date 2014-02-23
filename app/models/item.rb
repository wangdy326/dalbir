class Item < ActiveRecord::Base
  belongs_to :vendor
 
  attr_accessible :item_desc,
                  :vendor_id, 
                  :item_name,  
                  :item_shipping_point, 
                  :master_pack_cube, 
                  :master_pack_gross_weight, 
                  :master_pack_qty_pallet, 
                  :master_pk_dim, 
                  :item_no, 
                  :unit_price_e, 
                  :master_pk_net_weight, 
                  :origin_country, 
                  :pallet, 
                  :pallet_config, 
                  :pallet_dim, 
                  :pallet_weight, 
                  :pallet_xchng, 
                  :pre_upc_code, 
                  :sell_unit_dim, 
                  :sell_unit_net_weight, 
                  :sell_unit_qty_mstr_pk, 
                  :shelf_life_from_dom, 
                  :shelf_life_guaranteed_dom, 
                  :spoil_all, 
                  :truckload_qty, 
                  :upc_code, 
                  :unit_price_w

end

