module Spree::ActiveShipping::ShippingMethod
  def self.included(model)
   
  end

  def calculate_cost_per_line_item(line_item)
    shipping_rate = shipping_rates.detect { |sr| sr.shipping_category_id == line_item.product.shipping_category_id }
    calc = shipping_rate && shipping_rate.calculator || self.calculator
    #logger.debug("INSPECT using calculator #{calc.inspect}");
    result = calc.compute([line_item])
	#logger.debug("INSPECT calculat_cost_per_line_item result: #{result}, line_item: #{line_item.inspect}")
	result
  end
end