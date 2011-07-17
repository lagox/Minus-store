#coding:UTF-8
Catalog.delete_all
Catalog.create(:title => "Минус номер один",
               :file => "file1.mp3",
               :length => 4.35,
               :price => 2000,
               :sold => false)
Catalog.create(:title => "Минус номер два",
               :file => "file2.mp3",
               :length => 4.36,
               :price => 3000,
               :sold => false)
Catalog.create(:title => "Минус номер три",
               :file => "file3.mp3",
               :length => 4.35,
               :price => 4000,
               :sold => false)                              
               
