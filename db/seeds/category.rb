# frozen_string_literal: true

%w[Tech Running Music].each do |category|
  Category.create!(name: category) unless Category.exists?(name: category)
end
