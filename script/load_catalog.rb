Catalog.transaction do
  (1..100).each do |i|
    Catalog.create(:title => "Minus number #{i}",
                   :length => i,
                   :price => i,
                   :sold => false )
  end
end
