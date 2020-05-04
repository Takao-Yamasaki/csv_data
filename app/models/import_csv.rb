class ImportCsv < ApplicationRecord
    #CSVデータのパスを引数として受け取り、インポート処理をする
    #クラスメソッドの場合、new演算子がいらない
    def self.import(path)
        list = []
        CSV.foreach(path,headers:true) do |row|
            list << {
                name: row["name"],
                age: row["age"],
                address: row["address"]
            }
            User.create(list)
        end
    end
end