class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :line_items
  has_many :line_items

  def total
    total = 0
    self.items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item_id)
    @matching_item = self.line_items.find {|line_item| item_id == line_item.item_id}
    if @matching_item.nil?
      @new_line_item = self.line_items.build(item_id: item_id)
    else
      @matching_item.tap {|m_i| m_i.quantity += 1} 
    end  
  end


end
