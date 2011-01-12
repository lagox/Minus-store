Catalog.transaction do
  (1..100).each do |i|
    Catalog.create(:title => "Minus number #{i}",
                   :file => "file#{i}.mp3",
                   :length => i,
                   :price => i,
                   :sold => false )
  end
end
