class Link < ApplicationRecord
  belongs_to :owner, :polymorphic => true

  def category
    (self[:category] || 'other')
  end
end
