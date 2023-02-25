class Like < ActiveRecord::Base
  belongs_to :authored, class_name: 'User'
  belongs_to :post
end
