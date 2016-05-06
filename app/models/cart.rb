class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :line_items
  has_many :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def update_line_items
      self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
     end
  end

  def add_item(item_id)
      @matching = self.line_items.find_by(item_id: item_id)
      if @matching
        @matching.quantity += 1
        @matching
      else
      @new_line_item = self.line_items.build(item_id: item_id)
    end  
  end


end
